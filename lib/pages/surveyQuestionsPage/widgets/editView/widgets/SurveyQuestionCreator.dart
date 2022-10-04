import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/widgets/button/EnvButton.dart';
import 'package:interview_survey_creator_simple/services/KeyboardService.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';
import 'package:interview_survey_creator_simple/styles/BrandedTextStyle.dart';
import 'package:interview_survey_creator_simple/widgets/controls/EnvTextField.dart';
import 'package:interview_survey_creator_simple/widgets/controls/models/EnvTextFieldConfig.dart';
import 'package:interview_survey_creator_simple/providers/SurveyProvider.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/QuestionCreatorProvider.dart';
import 'SurveyQuestionTypeDropdown.dart';

class SurveyQuestionCreator extends StatelessWidget {
  final SurveyProvider surveyProvider;
  const SurveyQuestionCreator({Key? key, required this.surveyProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionCreatorProvider>(
      create: (context) => QuestionCreatorProvider(),
      child: Consumer<QuestionCreatorProvider>(
        builder: (context, questionCreatorProvider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* Creator Form */
              const SurveyQuestionTypeDropdown(),
              const SizedBox(height: 24),
              EnvTextField(
                config: EnvTextFieldConfig(
                  maxLength: 500,
                  hintText: 'Input Question here...',
                  keyboardType: KeyboardType.noRestrictions
                ),
                onChanged: (value) => questionCreatorProvider.updateQuestionTitle(value),
              ),
              questionCreatorProvider.question.getForm(),
              const SizedBox(height: 32),

              /* Preview */
              Text('Preview', style: BrandedTextStyle.b1Reg(BrandedColors.primary500)),
              const SizedBox(height: 24),
              questionCreatorProvider.question.getPreview(),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  EnvButton(
                    buttonText: 'Cancel',
                    color: BrandedColors.gray300,
                    useAutoWidth: false,
                    onClick: () {
                      surveyProvider.updateIsCreatingQuestion(false);
                    }
                  ),
                  const SizedBox(width: 24),
                  EnvButton(
                    buttonText: 'Save',
                    useAutoWidth: false,
                    onClick: () {
                      surveyProvider.addQuestion(questionCreatorProvider.question);
                    }
                  ),
                ],
              ),
            ],
          );
        }
      ),
    );
  }
}
