import 'SurveyQuestionable.dart';

class Survey {
  String name;
  final List<SurveyQuestionable> questions;

  Survey({
    required this.name,
    required this.questions
  });
}
