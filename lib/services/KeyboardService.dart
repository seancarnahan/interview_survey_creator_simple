// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/services.dart';

class KeyboardService {
 List< TextInputFormatter> filteringTextInputFormatters;

  KeyboardService(KeyboardType keyboardType, [List<TextInputFormatter>? additionalFormatter])
    : filteringTextInputFormatters = getInputFormatters(keyboardType, additionalFormatter);

  static List<TextInputFormatter> getInputFormatters(KeyboardType keyboardType, [List<TextInputFormatter>? additionalFormatter]) {
    List<TextInputFormatter> inputFormatters;
    switch (keyboardType) {
      case KeyboardType.numbers:
        inputFormatters = [FilteringTextInputFormatter.digitsOnly];
        break;
      case KeyboardType.chars:
        inputFormatters = [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))];
        break;
      case KeyboardType.charsAndNumbersAndSpaces:
        inputFormatters = [FilteringTextInputFormatter.allow(RegExp('[0-9a-zA-Z\ ]'))];
        break;
      case KeyboardType.noRestrictions:
        inputFormatters = [];
        break;
      default:
        inputFormatters = [FilteringTextInputFormatter.allow(RegExp('[0-9a-zA-Z\ ]'))];
        throw('Provided an invalid keyboard type that cannot be handled');
    }
    if (additionalFormatter != null) {
      inputFormatters = List.from(inputFormatters)..addAll(additionalFormatter);
    }
    return inputFormatters;
  }
}

enum KeyboardType {
  chars,
  numbers,
  charsAndNumbersAndSpaces,
  noRestrictions
}
