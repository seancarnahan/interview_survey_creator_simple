import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/models/Survey.dart';
import 'package:interview_survey_creator_simple/providers/SurveyProvider.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';
import 'package:interview_survey_creator_simple/styles/BrandedTextStyle.dart';
import 'package:interview_survey_creator_simple/widgets/cards/EnvCard.dart';

import 'SurveyQuestionsSurveyName.dart';

class SurveyQuestionsHeaderCard extends StatelessWidget {
  final SurveyProvider surveyProvider;
  const SurveyQuestionsHeaderCard({Key? key, required this.surveyProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Survey survey = surveyProvider.survey!;
    String numQuestions = '${survey.questions.length} Questions';
    String languages = survey.languages.join(', ');

    return EnvCard(
      minHeight: 92,
      hasBorder: false,
      color: BrandedColors.secondary500,
      content: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SurveyQuestionSurveyName(surveyProvider: surveyProvider),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(languages, style: BrandedTextStyle.b4Legal(BrandedColors.gray500)),
                Text(numQuestions, style: BrandedTextStyle.b3LabelBold(BrandedColors.black500)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
