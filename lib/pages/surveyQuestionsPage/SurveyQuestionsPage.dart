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
    double viewChangerIconSize = isMobile ? 32 : 24;
    return ChangeNotifierProvider.value(
      value: SurveyProvider(),
      child: Consumer<SurveyProvider>(
        builder: (context, surveyProvider, child) {
          Widget turnOnEditMode = EnvGestureDetector(
            child: Icon(
              Icons.mode_edit,
              size: viewChangerIconSize,
              color: BrandedColors.primary500
            ),
            onTap: () {
              surveyProvider.updateIsEditing(!surveyProvider.isEditing);
            },
          );
          Widget turnOffEditMode = Row(
            children: [
              EnvGestureDetector(
                child: Icon(
                  Icons.clear,
                  size: viewChangerIconSize,
                  color: BrandedColors.primary500
                ),
                onTap: () {
                  surveyProvider.updateIsEditing(!surveyProvider.isEditing, false);
                },
              ),
              SizedBox(width: isMobile ? 16 : 24),
              EnvGestureDetector(
                child: Icon(
                  Icons.check,
                  size: viewChangerIconSize,
                  color: BrandedColors.primary500
                ),
                onTap: () {
                  surveyProvider.updateIsEditing(!surveyProvider.isEditing, true);
                },
              )
            ],
          );

          return EnvScaffold(
            topRightAction: surveyProvider.isEditing ? turnOffEditMode : turnOnEditMode,
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
