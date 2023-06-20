import 'package:flutter/material.dart';
import 'package:tourease/theme/app_theme.dart';
import 'package:tourease/util/constants.dart';
import 'package:tourease/widgets/custom_text.dart';

class CustomButton extends StatefulWidget {
  double height;
  Color borderColor;
  Color backgroundColor;
  Color textColor;
  String buttonTitle;
  double leftPadding;
  double rightPadding;
  double topPadding;
  double bottomPadding;

  void Function()? onTap;
  CustomButton(
      {super.key,
      required this.backgroundColor,
      required this.borderColor,
      required this.buttonTitle,
      this.height = Constant.customButtonHeight,
      required this.textColor,
      this.leftPadding = 20,
      this.rightPadding = 20,
      this.bottomPadding = 0,
      this.topPadding = 20,
      this.onTap});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  double? ht;

  @override
  Widget build(BuildContext context) {
    ht = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
          left: widget.leftPadding,
          right: widget.rightPadding,
          bottom: widget.bottomPadding,
          top: widget.topPadding),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: widget.onTap,
        child: Container(
          height: ht! * widget.height,
          decoration: BoxDecoration(
              boxShadow: [Constant.boxShadow(color: widget.backgroundColor)],
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: widget.borderColor)),
          child: Center(
            child: CustomText(
              title: widget.buttonTitle,
              color: widget.textColor,
              fontWight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
