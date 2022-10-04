import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/models/SurveyQuestionable.dart';
import 'package:interview_survey_creator_simple/providers/SurveyProvider.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';
import 'package:interview_survey_creator_simple/widgets/button/EnvGestureDetector.dart';

class RemoveQuestionButton extends StatelessWidget {
  final SurveyProvider surveyProvider;
  final SurveyQuestionable question;
  const RemoveQuestionButton({
    Key? key,
    required this.surveyProvider,
    required this.question
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EnvGestureDetector(
      onTap: () => surveyProvider.removeQuestionByRank(question.rank),
      child: const Icon(
        Icons.do_not_disturb_on,
        size: 32,
        color: BrandedColors.red500,
      ),
    );
  }
}
