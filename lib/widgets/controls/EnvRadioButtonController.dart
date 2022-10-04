import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';
import 'package:interview_survey_creator_simple/styles/BrandedTextStyle.dart';

import 'models/EnvRadioButtonConfig.dart';

class EnvRadioButtonController extends StatefulWidget {
  final List<EnvRadioButtonConfig> configs;

  const EnvRadioButtonController({
    Key? key,
    required this.configs
  }) : super(key: key);

  @override
  EnvRadioButtonControllerState createState() => EnvRadioButtonControllerState();
}

class EnvRadioButtonControllerState extends State<EnvRadioButtonController> {
  dynamic groupValue;

  @override
  void initState() {
    super.initState();
    setState(() {
      groupValue = widget.configs[0].groupValue;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.configs.length,
        (index) {
          EnvRadioButtonConfig config = widget.configs[index];
          final bool selected = config.value == groupValue;
          return Padding(
            padding: EdgeInsets.only(bottom: index < (widget.configs.length - 1) ? 16: 0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: InkWell(
                    onTap: () {
                      config.onChanged(config.value);
                      setState(() {
                        groupValue = config.value;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.all(0.5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: BrandedColors.black500, width: 2)
                      ),
                      child: Icon(
                        Icons.circle,
                        size: 16,
                        color: selected ? BrandedColors.primary500 : BrandedColors.white500,
                      ),
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    config.label,
                    style: BrandedTextStyle.b3Label(BrandedColors.black500)
                  ),
                )
              ],
            ),
          );
        }
      )
    );
  }
}
