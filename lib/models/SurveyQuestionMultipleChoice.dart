import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/pages/surveyQuestionsPage/widgets/previewView/widgets/PreviewQuestionContainer.dart';
import 'package:interview_survey_creator_simple/providers/QuestionCreatorProvider.dart';
import 'package:interview_survey_creator_simple/services/KeyboardService.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';
import 'package:interview_survey_creator_simple/widgets/button/EnvGestureDetector.dart';
import 'package:interview_survey_creator_simple/widgets/controls/EnvRadioButtonController.dart';
import 'package:interview_survey_creator_simple/widgets/controls/EnvTextField.dart';
import 'package:interview_survey_creator_simple/widgets/controls/models/EnvRadioButtonConfig.dart';
import 'package:interview_survey_creator_simple/widgets/controls/models/EnvTextFieldConfig.dart';

import 'SurveyQuestionable.dart';

class SurveyQuestionMultipleChoice implements SurveyQuestionable {
  @override
  String title;

  @override
  int rank;

  final SurveyQuestionType type = SurveyQuestionType.MultipleChoice;

  final QuestionCreatorProvider questionCreatorProvider;

  int numOptions = 2;

  List<String> optionTitles = List.generate(2, ((index) => 'Answer Choice $index...'));

  SurveyQuestionMultipleChoice(this.title, this.rank, this.questionCreatorProvider);

  @override
  Widget getForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          itemCount: numOptions,
          shrinkWrap: true,
          itemBuilder: (context, index) => _getMultipleChoiceInput(index)
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            EnvGestureDetector(
              child: const Icon(
                Icons.add,
                size: 32,
                color: BrandedColors.black500
              ),
              onTap: () {
                numOptions += 1;
                optionTitles.add('Answer Choice ${numOptions-1}...');
                questionCreatorProvider.updateQuestion();
              },
            ),
            const SizedBox(width: 24),
            Visibility(
              visible: numOptions > 1,
              child: EnvGestureDetector(
                child: const Icon(
                  Icons.horizontal_rule_rounded,
                  size: 32,
                  color: BrandedColors.black500
                ),
                onTap: () {
                  numOptions -= 1;
                  optionTitles.removeLast();
                  questionCreatorProvider.updateQuestion();
                },
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  Widget getPreview() {
    return PreviewQuestionContainer(
      title: title,
      rank: rank,
      content: EnvRadioButtonController(
        configs: List.generate(numOptions, (index) => EnvRadioButtonConfig(
            label: optionTitles[index],
            value: index,
            groupValue: 1,
            onChanged: (dynamic str){}
          ),
        )
      )
    );
  }

  Widget _getMultipleChoiceInput(int optionTitleIndex) {
    return Column(
      children: [
        const SizedBox(height: 24),
        EnvTextField(
          config: EnvTextFieldConfig(
            maxLength: 20,
            initialText: optionTitles[optionTitleIndex],
            keyboardType: KeyboardType.charsAndNumbersAndSpaces,
          ),
          onChanged: (value) {
            optionTitles[optionTitleIndex] = value;
            questionCreatorProvider.updateQuestion();
          },
        ),
      ],
    );
  }
}
