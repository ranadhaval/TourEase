import 'package:flutter/material.dart';
import 'package:tourease/theme/app_theme.dart';
import 'package:tourease/util/constants.dart';

class CustomText extends StatefulWidget {
  String title;
  String fontfamily;
  double fontSize;
  Color color;
  FontWeight fontWight;
  double height;
  TextAlign textAlign;
  double wordSpacing;
  double topPadding;
  double bottomPadding;
  double leftPadding;
  double rightPadding;

  CustomText(
      {this.color = Colors.black,
      this.fontSize = Constant.midiumn,
      this.fontWight = AppTheme.fontWeight,
      this.fontfamily = AppTheme.appFontName,
      required this.title,
      this.height = 1.0,
      this.wordSpacing = 0,
      this.bottomPadding = Constant.zero,
      this.topPadding = Constant.zero,
      this.leftPadding = Constant.zero,
      this.rightPadding = Constant.zero,
      this.textAlign = TextAlign.justify});

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: widget.leftPadding,
          right: widget.rightPadding,
          top: widget.topPadding,
          bottom: widget.bottomPadding),
      child: Text(
        widget.title,
        textAlign: widget.textAlign,
        style: TextStyle(
            color: widget.color,
            fontFamily: widget.fontfamily,
            fontWeight: widget.fontWight,
            fontSize: widget.fontSize,
            height: widget.height,
            letterSpacing: widget.wordSpacing),
      ),
    );
  }
}
