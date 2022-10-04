import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';
import 'package:interview_survey_creator_simple/styles/BrandedTextStyle.dart';

import 'models/EnvTabbarItemConfig.dart';

class EnvTabbar extends StatefulWidget {
  final List<EnvTabbarItemConfig> tabs;
  final EdgeInsets? tabbarPadding;
  const EnvTabbar({Key? key,
    required this.tabs,
    this.tabbarPadding,
  }) : super(key: key);

  @override
  State<EnvTabbar> createState() => _EnvTabbarState();
}

class _EnvTabbarState extends State<EnvTabbar> with SingleTickerProviderStateMixin{
  late TabController _controller;
  int currentTabIndex = 0;

  @override
  void initState() {
    setState(() {
      _controller = TabController(length: widget.tabs.length, vsync: this, initialIndex: currentTabIndex);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: widget.tabbarPadding ?? const EdgeInsets.all(0),
          child: TabBar(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            indicatorWeight: 3.0,
            indicatorColor: BrandedColors.primary500,
            indicator: const BoxDecoration(
              color: BrandedColors.secondary500,
              border: Border(
                bottom: BorderSide(width: 2.0, color: BrandedColors.primary500)
              )
            ),
            labelColor: BrandedColors.primary500,
            labelPadding: const EdgeInsets.symmetric(vertical: 6.0),
            labelStyle: BrandedTextStyle.b3LabelBold(BrandedColors.primary500),
            unselectedLabelColor: BrandedColors.gray500,
            unselectedLabelStyle: BrandedTextStyle.b3Label(BrandedColors.gray500),
            tabs: List.generate(widget.tabs.length, (index) => Text(widget.tabs[index].tabbarTitle)),
            onTap: (value) {
              setState(() { currentTabIndex = value; });
            },
          ),
        ),
        widget.tabs[currentTabIndex].tabbarViewContent
      ],
    );
  }
}
