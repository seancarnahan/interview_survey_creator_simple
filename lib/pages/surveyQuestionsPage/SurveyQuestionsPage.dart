import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:interview_survey_creator_simple/models/Survey.dart';
import 'package:interview_survey_creator_simple/widgets/scaffold/EnvTabbar.dart';
import 'package:interview_survey_creator_simple/widgets/scaffold/models/EnvTabbarItemConfig.dart';
import 'package:interview_survey_creator_simple/providers/SurveyProvider.dart';
import 'package:interview_survey_creator_simple/widgets/button/EnvGestureDetector.dart';
import 'package:interview_survey_creator_simple/widgets/scaffold/EnvScaffold.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';

import 'widgets/SurveyQuestionsHeaderCard.dart';
import 'widgets/editView/EditView.dart';
import 'widgets/previewView/PreviewView.dart';

class SurveyQuestionsPage extends StatelessWidget {
  const SurveyQuestionsPage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    SurveyProvider().setSurvey(Survey(name: 'My New Survey', languages: [], questions: []));
    return ChangeNotifierProvider.value(
      value: SurveyProvider(),
      child: EnvScaffold(
        topRightAction: EnvGestureDetector(
          child: const Icon(
            Icons.ios_share,
            size: 32,
            color: BrandedColors.primary500
          ),
          onTap: () {
            // TODO export modal
          },
        ),
        pageContent: Consumer<SurveyProvider>(
          builder: (context, surveyProvider, child) {
            Survey survey = surveyProvider.getSurvey()!;
            return Column(
              children: [
                SurveyQuestionsHeaderCard(surveyProvider: surveyProvider),
                const SizedBox(height: 32),
                EnvTabbar(
                  tabs: [
                    EnvTabbarItemConfig(
                      'Preview',
                      PreviewView(surveyProvider: surveyProvider)
                    ),
                    EnvTabbarItemConfig(
                      'Edit',
                      EditView(surveyProvider: surveyProvider)
                    ),
                  ]
                )
              ],
            );
          }
        )
      ),
    );
  }
}
