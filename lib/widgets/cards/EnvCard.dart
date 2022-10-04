import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';

class EnvCard extends StatelessWidget {
  final Widget content;
  final double minHeight;
  final double maxHeight;
  final double? minWidth;
  final double maxWidth;
  final Color color;
  final Color borderColor;
  final bool hasBorder;
  final bool useAuto; // overrides width
  final double borderRadius;
  final double borderWidth;
  final void Function()? onTap;
  const EnvCard({
    Key? key,
    required this.content,
    required this.minHeight,
    this.maxHeight=double.infinity,
    this.minWidth,
    this.maxWidth=double.infinity,
    this.color=BrandedColors.white500,
    this.borderColor=BrandedColors.gray300,
    this.hasBorder=true,
    this.useAuto=false,
    this.borderRadius=8.0,
    this.borderWidth=1.0,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: minHeight,
        maxHeight: maxHeight,
        minWidth: useAuto || minWidth == null ? double.infinity : minWidth!,
        maxWidth: maxWidth
      ),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(
            style: hasBorder ? BorderStyle.solid : BorderStyle.none,
            width: borderWidth,
            color: borderColor
          )
        ),
        child: onTap == null ? Container(child: content)
          : InkWell(
              onTap: () => onTap!(),
              splashColor: BrandedColors.secondary500,
              highlightColor: BrandedColors.secondary500,
              child: Container(child: content),
            )
      ),
    );
  }
}
