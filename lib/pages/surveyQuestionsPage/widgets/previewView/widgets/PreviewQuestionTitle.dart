import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';
import 'package:interview_survey_creator_simple/styles/BrandedTextStyle.dart';

class PreviewQuestionTitle extends StatelessWidget {
  final String title;
  final int rank;
  const PreviewQuestionTitle({
    Key? key,
    required this.title,
    required this.rank
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$rank.',
        style: BrandedTextStyle.b1Reg(BrandedColors.black500),
        children: [
          const WidgetSpan(
            child: SizedBox(width: 16)
          ),
          TextSpan(
            text: title,
            style: BrandedTextStyle.b3Label(BrandedColors.black500),
          )
        ]
      )
    );
  }
}
