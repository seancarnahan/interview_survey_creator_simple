import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/constants/DesktopContstraints.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';

class EnvScaffold extends StatelessWidget {
  final Widget pageContent;
  final Widget? topRightAction;
  const EnvScaffold({
    Key? key,
    required this.pageContent,
    this.topRightAction
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BrandedColors.white500,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            elevation: 0,
            leadingWidth: 0,
            backgroundColor: BrandedColors.white500,
            title: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: const [
                  Image(image: AssetImage('assets/Enveritas.png'))
                ],
              )
            ),
            actions: [
              Visibility(
                visible: topRightAction != null,
                child: SizedBox(
                  child: Row(
                    children: [
                      topRightAction ?? const Icon(Icons.question_mark)
                    ],
                  ),
                )
              ),
              const SizedBox(width: 24, height: 32)
            ]
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: DeskTopMaxWidth,
                      maxHeight: double.infinity
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        pageContent
                      ],
                    )
                  )
                ],
              ),
            )
          ),
        )
      ),
    );
  }
}
