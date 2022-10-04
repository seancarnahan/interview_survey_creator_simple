import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/providers/SurveyProvider.dart';

import 'widgets/CollapsedQuestionBuilder.dart';
import 'widgets/CreateQuestionButton.dart';
import 'widgets/SurveyQuestionCreator.dart';

class EditView extends StatelessWidget {
  final SurveyProvider surveyProvider;
  const EditView({Key? key, required this.surveyProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CollapsedQuestionBuilder(surveyProvider: surveyProvider),
        Visibility(
          visible: surveyProvider.survey.questions.isNotEmpty,
          child: const SizedBox(height: 24),
        ),
        if (surveyProvider.isCreatingQuestion) SurveyQuestionCreator(surveyProvider: surveyProvider)
          else CreateQuestionButton(surveyProvider: surveyProvider),
        const SizedBox(height: 32),
      ],
    );
  }
}
