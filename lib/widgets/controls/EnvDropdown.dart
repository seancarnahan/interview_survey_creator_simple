import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';
import 'package:interview_survey_creator_simple/styles/BrandedTextStyle.dart';
import 'package:interview_survey_creator_simple/widgets/controls/models/EnvDropdownConfig.dart';

class EnvDropdown extends StatelessWidget {
  final EnvDropdownConfig config;
  const EnvDropdown({Key? key, required this.config}) : super(key: key);

  List<DropdownMenuItem<dynamic>> _getMenuItems() {
    List<DropdownMenuItem<dynamic>> menuItems = [];
    for (dynamic menuItemText in config.items.keys.toList()) {
      menuItems.add(
        DropdownMenuItem(
          value: config.items[menuItemText]!,
          child: Text(
            menuItemText,
            style: BrandedTextStyle.b3Label(BrandedColors.black500)
          ),
        )
      );
    }
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<dynamic>> menuItems = _getMenuItems();
    return DropdownButtonFormField(
      isDense: true,
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: BrandedColors.black500,
        size: 32,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: BrandedColors.secondary500,
      ),
      dropdownColor: BrandedColors.white500,
      value: menuItems[0].value,
      onChanged: config.onChanged,
      items: menuItems,
      isExpanded: true
    );
  }
}
