import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/pages/surveyQuestionsPage/widgets/previewView/widgets/PreviewQuestionContainer.dart';
import 'package:interview_survey_creator_simple/services/KeyboardService.dart';
import 'package:interview_survey_creator_simple/widgets/controls/EnvTextField.dart';
import 'package:interview_survey_creator_simple/widgets/controls/models/EnvTextFieldConfig.dart';

import 'SurveyQuestionable.dart';

class SurveyQuestionText implements SurveyQuestionable {
  @override
  String title;

  @override
  int rank;

  final SurveyQuestionType type = SurveyQuestionType.MultipleChoice;

  SurveyQuestionText(this.title, this.rank);

  @override
  Widget getForm() {
    return const SizedBox(height: 0, width: 0);
  }

  @override
  Widget getPreview() {
    return PreviewQuestionContainer(
      title: title,
      rank: rank,
      content: EnvTextField(
        config: EnvTextFieldConfig(
          maxLength: 500,
          hintText: 'Answer here...',
          keyboardType: KeyboardType.charsAndNumbersAndSpaces
        ),
        onChanged: (value) => {},
      ),
    );
  }
}
