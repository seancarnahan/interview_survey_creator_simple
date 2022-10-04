import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/models/SurveyQuestionable.dart';
import 'package:interview_survey_creator_simple/providers/SurveyProvider.dart';

import 'CollapsedQuestion.dart';
import 'RemoveQuestionButton.dart';
import 'ReorderQuestionDragHandle.dart';

class CollapsedQuestionBuilder extends StatelessWidget {
  final SurveyProvider surveyProvider;
  const CollapsedQuestionBuilder({Key? key, required this.surveyProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<SurveyQuestionable> questions = surveyProvider.survey!.questions;
    return ReorderableListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: questions.length,
      buildDefaultDragHandles: false,
      onReorder: (int oldIndex, int newIndex) {
        int newIndexOffset = newIndex > oldIndex ? 1 : 0;
        surveyProvider.reorderQuestions(
          oldIndex,
          newIndex - newIndexOffset
        );
      },
      itemBuilder: (context, index) {
        SurveyQuestionable question = questions[index];
        if (surveyProvider.isCreatingQuestion) {
          return Row(
            key: ValueKey(question),
            children: [CollapsedQuestion(question: question)],
          );
        }
        return Row(
          key: ValueKey(question),
          children: [
            RemoveQuestionButton(surveyProvider: surveyProvider, question: question),
            const SizedBox(width: 24),
            CollapsedQuestion(question: question),
            const SizedBox(width: 16),
            ReorderQuestionDragHandle(questionRank: index)
          ],
        );
      },
    );
  }
}
