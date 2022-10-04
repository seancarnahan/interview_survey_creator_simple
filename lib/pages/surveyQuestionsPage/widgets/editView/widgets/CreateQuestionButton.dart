import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/providers/SurveyProvider.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';
import 'package:interview_survey_creator_simple/widgets/button/EnvGestureDetector.dart';

class CreateQuestionButton extends StatelessWidget {
  final SurveyProvider surveyProvider;
  const CreateQuestionButton({Key? key, required this.surveyProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EnvGestureDetector(
      child: const Icon(
        Icons.add,
        size: 32,
        color: BrandedColors.black500,
      ),
      onTap: () {
        surveyProvider.updateIsCreatingQuestion(true);
      },
    );
  }
}
