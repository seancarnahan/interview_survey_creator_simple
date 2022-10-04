import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview_survey_creator_simple/services/KeyboardService.dart';

class EnvTextFieldConfig {
  final Widget? prefix;
  final int maxLength;
  final String label;
  final KeyboardType keyboardType;
  final String initialText;
  final String hintText;
  final TextStyle? inputTextStyle;
  final bool autoFocus;
  final List<TextInputFormatter>? additionalFormatter;
  
  EnvTextFieldConfig({
    this.prefix,
    this.maxLength=20,
    this.label = '',
    this.keyboardType = KeyboardType.charsAndNumbersAndSpaces,
    this.initialText = '',
    this.hintText = '',
    this.inputTextStyle,
    this.autoFocus=false,
    this.additionalFormatter
  });
}
