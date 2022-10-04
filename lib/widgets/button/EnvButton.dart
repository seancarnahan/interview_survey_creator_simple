import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';
import 'package:interview_survey_creator_simple/styles/BrandedTextStyle.dart';

class EnvButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onClick;
  final bool useAutoWidth;
  final bool isDisabled;
  final Color color;
  final Color textColor;
  
  const EnvButton({
    Key? key,
    required this.buttonText,
    required this.onClick,
    this.useAutoWidth = false,
    this.isDisabled = false,
    this.color = BrandedColors.primary500,
    this.textColor = BrandedColors.white500,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: useAutoWidth ? double.infinity : null,
      height: 48,
      child: TextButton(
        onPressed: isDisabled ? (){} : onClick,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            isDisabled ? BrandedColors.gray300 : color
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(horizontal: 32, vertical: 14)
          ),
          alignment: Alignment.center,
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          )),
        ),
        child: Text(buttonText, style: BrandedTextStyle.b3LabelBold(textColor)),
      )
    );
  }
}
