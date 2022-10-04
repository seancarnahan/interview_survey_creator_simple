# interview_survey_creator_simple

This project is tool created for an interview with Enveritas that allows users to Create and Edit custom Surveys.

## Getting Started
- Runs on broswers, ios, and android
- Versions: Flutter 3.3.0 and Dart 2.18.0
  - https://docs.flutter.dev/get-started/install
- "flutter run" from root of App

## Structure
- Majority of code is in /lib
- /ios, /macos, /web, /linux, /windows, /android are used for specific configuration options for their corresponding device(ex: controlling release versioning)
- /constants -> Just has device constraints
- /models -> Survey Object has a list of type SurveyQuestionable(abstract) which has 4 classes that implement it(text, boolean, number, multiple choice)
- /providers -> State Management: https://pub.dev/packages/provider
  - SurveyProvider -> has all the actions that can performed on a survey and updates is corresponding members with the changes
  - QuestionCreatorProvider -> is used to sync the state with question creator form and its corresponding preview
- /services -> Keyboard service is used for textfields(taken from previous app, but still my code)
- /widgets -> taken from previous side project and basic common components with Enveritas theming

## Disclaimers
- Used styling and assets from https://enveritas.org
- Used a mobile first approach
- Majority of widgets in interview_survey_creator/widgets are from previous side project that I have written

## Flutter Doctor Summary:
<img width="520" alt="image" src="https://user-images.githubusercontent.com/29028698/193466472-2c982a87-ac30-48cb-9794-d15c61976c99.png">
