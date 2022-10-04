import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/models/Survey.dart';
import 'package:interview_survey_creator_simple/providers/SurveyProvider.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';
import 'package:interview_survey_creator_simple/styles/BrandedTextStyle.dart';
import 'package:interview_survey_creator_simple/widgets/button/EnvGestureDetector.dart';
import 'package:interview_survey_creator_simple/widgets/controls/EnvTextField.dart';
import 'package:interview_survey_creator_simple/widgets/controls/models/EnvTextFieldConfig.dart';

class SurveyQuestionSurveyName extends StatefulWidget {
  final SurveyProvider surveyProvider;
  const SurveyQuestionSurveyName({Key? key, required this.surveyProvider}) : super(key: key);

  @override
  State<SurveyQuestionSurveyName> createState() => _SurveyQuestionSurveyNameState();
}

class _SurveyQuestionSurveyNameState extends State<SurveyQuestionSurveyName> {
  bool isUpdatingSurveyName = false;
  String surveyName = '';

  @override
  void initState() {
    surveyName = widget.surveyProvider.survey!.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Survey survey = widget.surveyProvider.survey!;
    String name = survey.name;
    Widget editModeButton =  EnvGestureDetector(
      onTap: () => setState(() {
        isUpdatingSurveyName = true;
      }),
      child: const Icon(
        Icons.mode_edit,
        color: BrandedColors.black500,
        size: 16,
      )
    );
    Widget saveChangesButton = EnvGestureDetector(
      onTap: () => setState(() {
        isUpdatingSurveyName = false;
        widget.surveyProvider.updateSurveyName(surveyName);
      }),
      child: const Icon(
        Icons.check,
        color: BrandedColors.black500,
        size: 24,
      )
      );
    Widget surveyNameDisplayable = Text(
      name,
      style: BrandedTextStyle.b1Reg(BrandedColors.primary500)
    );
    Widget surveyNameTextField = EnvTextField(
      config: EnvTextFieldConfig(
        autoFocus: true,
        maxLength: 20,
        initialText: surveyName,
        inputTextStyle: BrandedTextStyle.b3Label(BrandedColors.primary500)
      ),
      onChanged: (value) => setState(() {
        surveyName = value;
      }),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (isUpdatingSurveyName) ... [
          Expanded(
            child: surveyNameTextField,
          ),
          saveChangesButton
        ] else ... [
          surveyNameDisplayable,
          editModeButton
        ]
      ],
    );
  }
}
