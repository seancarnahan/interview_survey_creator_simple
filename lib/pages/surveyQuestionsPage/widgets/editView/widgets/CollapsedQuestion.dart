import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/models/SurveyQuestionable.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';
import 'package:interview_survey_creator_simple/styles/BrandedTextStyle.dart';

class CollapsedQuestion extends StatelessWidget {
  final SurveyQuestionable question;
  const CollapsedQuestion({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (question.rank != 1)
            const SizedBox(height: 24),
          RichText(
            text: TextSpan(
              text: '${question.rank.toString()}.',
              style: BrandedTextStyle.b1Reg(BrandedColors.black500),
              children: [
                const WidgetSpan(
                  child: SizedBox(width: 8)
                ),
                TextSpan(
                  text: question.title,
                  style: BrandedTextStyle.b3Label(BrandedColors.black500)
                )
              ]
            )
          ),
          const SizedBox(height: 24),
          const Divider(height: 1, color: BrandedColors.black500)
        ],
      )
    );
  }
}
