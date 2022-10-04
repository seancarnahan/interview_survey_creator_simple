// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/models/Survey.dart';
import 'package:interview_survey_creator_simple/models/SurveyQuestionable.dart';

/*
 * Singleton and ChangeNotifier(Provider):
 * This Service is used for once a survey is selected, then we can run certain functions on it
 * Using Singleton to avoid routing params and so I can access provider w/out consuming it
 * Otherwise accessing the Provider would have to have your widget also consume and be updated by it
 * Both SurveyQuestionsEditPage and SurveyQuestionCreatorPage are below the declaration of this provider in widget tree
 */
class SurveyProvider extends ChangeNotifier {
  Survey survey = Survey(questions: []);
  Survey bufferSurvey = Survey(questions: []);
  bool isCreatingQuestion = false;
  bool isEditing = false;

  static final SurveyProvider _surveyProvider = SurveyProvider._internal();

  SurveyProvider._internal();

  factory SurveyProvider() {
    return _surveyProvider;
  }

  void updateIsCreatingQuestion(bool isCreating) {
    isCreatingQuestion = isCreating;
    notifyListeners();
  }

  void updateIsEditing(bool isEdit, [bool saveChanges=false]) {
    if (isEdit) {
      _resetBuffer();
    }
    if (saveChanges) {
      _saveBufferIntoSurvey();
    }
    _resetBuffer();
    _assignRanks();
    isEditing = isEdit;
    notifyListeners();
  }

  void addQuestion(SurveyQuestionable question) {
    bufferSurvey.questions.add(question);
    updateIsCreatingQuestion(false);
  }

  void removeQuestionByRank(int rank) {
    bufferSurvey.questions.removeWhere((question) => question.rank == rank);
    _assignRanks();
    notifyListeners();
  }

  void reorderQuestions(int oldQuestionIndex, int newQuestionIndex) {
    List<SurveyQuestionable> questions = bufferSurvey.questions;
    final SurveyQuestionable question = questions.removeAt(oldQuestionIndex);
    questions.insert(newQuestionIndex, question);
    _assignRanks();
    notifyListeners();
  }

  void _resetBuffer() {
    bufferSurvey.questions = [];
    bufferSurvey.questions.addAll(survey.questions);
  }

  void _saveBufferIntoSurvey() {
    survey.questions = [];
    survey.questions.addAll(bufferSurvey.questions);
  }

  void _assignRanks() {
    for (int i = 0; i < bufferSurvey.questions.length; i++) {
      bufferSurvey.questions[i].rank = i + 1;
    }
  }
}
