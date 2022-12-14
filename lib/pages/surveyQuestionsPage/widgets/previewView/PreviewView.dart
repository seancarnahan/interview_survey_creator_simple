import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/providers/SurveyProvider.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';
import 'package:interview_survey_creator_simple/styles/BrandedTextStyle.dart';

import 'widgets/SurveyNoQuestions.dart';

class PreviewView extends StatelessWidget {
  final SurveyProvider surveyProvider;
  const PreviewView({Key? key, required this.surveyProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (surveyProvider.survey.questions.isEmpty) {
      return const SurveyNoQuestions();
    }
    return Column(
      children: [
        Text('Preview', style: BrandedTextStyle.b1Reg(BrandedColors.primary500)),
        const SizedBox(height: 24),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true, // Listview's height will based on Children's height rather than height of its parent
          itemCount: surveyProvider.survey.questions.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: surveyProvider.survey.questions[index].getPreview(),
            );
          }
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
