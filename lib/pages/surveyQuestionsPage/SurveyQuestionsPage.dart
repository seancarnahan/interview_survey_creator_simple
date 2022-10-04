import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:interview_survey_creator_simple/constants/DesktopContstraints.dart';
import 'package:interview_survey_creator_simple/providers/SurveyProvider.dart';
import 'package:interview_survey_creator_simple/widgets/button/EnvGestureDetector.dart';
import 'package:interview_survey_creator_simple/widgets/scaffold/EnvScaffold.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';

import 'widgets/editView/EditView.dart';
import 'widgets/previewView/PreviewView.dart';

class SurveyQuestionsPage extends StatelessWidget {
  const SurveyQuestionsPage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    bool isMobile =  MediaQuery.of(context).size.width < MobileBreakpoint;
    return ChangeNotifierProvider.value(
      value: SurveyProvider(),
      child: Consumer<SurveyProvider>(
        builder: (context, surveyProvider, child) {
          return EnvScaffold(
            topRightAction: EnvGestureDetector(
              child: Icon(
                surveyProvider.isEditing ? Icons.check : Icons.mode_edit,
                size: isMobile ? 32 : 24,
                color: BrandedColors.primary500
              ),
              onTap: () {
                surveyProvider.updateIsEditing(!surveyProvider.isEditing);
              },
            ),
            pageContent: Column(
              children: [
                if (surveyProvider.isEditing)
                  EditView(surveyProvider: surveyProvider)
                else
                  PreviewView(surveyProvider: surveyProvider)
              ],
            )
          );
        }
      )
    );
  }
}
