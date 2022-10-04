// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

abstract class SurveyQuestionable {
  String title;
  int rank;

  SurveyQuestionable({
    required this.title,
    required this.rank,
  });

  // Fetch extra information from the user needed to create the question
  Widget getForm();

  // Creates a preview of what the question will look like
  Widget getPreview();

}

enum SurveyQuestionType {
  Text,
  Boolean,
  Number,
  MultipleChoice
}

