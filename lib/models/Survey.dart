import 'package:flutter/material.dart';

import 'SurveyQuestionable.dart';

class Survey {
  String name;
  List<String> languages;
  final List<SurveyQuestionable> questions;

  Survey({
    required this.name,
    required this.languages,
    required this.questions
  });
}
