// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tourease/theme/app_theme.dart';
import 'package:tourease/util/_string.dart';
import 'package:tourease/util/constants.dart';
import 'package:tourease/util/resources.dart';
import 'package:tourease/widgets/custom_text.dart';

class CustomAppBar extends StatefulWidget {
  String title;
  double space;
  void Function()? onTap;
  double leftPadding;
  double rightPadding;
  double topPadding;
  double bottomPadding;

  CustomAppBar(
      {required this.title,
      required this.space,
      this.onTap,
      this.leftPadding = Constant.zero,
      this.bottomPadding = Constant.zero,
      this.rightPadding = Constant.zero,
      this.topPadding = Constant.zero});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: widget.leftPadding,
          right: widget.rightPadding,
          top: widget.topPadding,
          bottom: widget.bottomPadding),
      child: InkWell(
        splashColor: AppTheme.colorTransprant,
        highlightColor: AppTheme.colorTransprant,
        onTap: widget.onTap,
        child: Row(
          children: [
            SvgPicture.asset(
              vector,
              width: Constant.vectorHeight,
              height: Constant.vectorWidth,
              color: AppTheme.colorblack,
            ),
            SizedBox(
              width: widget.space,
            ),
            CustomText(
              title: widget.title,
              fontWight: FontWeight.bold,
              fontfamily: Strings.emptyString,
              fontSize: Constant.appbarTitleSize,
            )
          ],
        ),
      ),
    );

    ;
  }
}
