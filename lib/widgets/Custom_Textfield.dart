import 'package:flutter/material.dart';
import 'package:tourease/theme/app_theme.dart';
import 'package:tourease/util/_string.dart';
import 'package:tourease/util/constants.dart';

class CustomTextFeild extends StatefulWidget {
  CustomTextFeild(
      {super.key,
      this.hintText = Strings.emptyString,
      this.isObscureText = Constant.isFlase,
      this.leftPadding = 20,
      this.rightPadding = 20,
      this.topPadding = 20,
      this.onChanged,
      this.onTap,
      this.bottomPadding = Constant.zero,
      this.contentLeftPadding = Constant.customfieldContentLeftPadding,
      this.contentRightPadding = Constant.customfieldContentRightPadding,
      this.contentTopPadding = Constant.customfieldContentTopPadding,
      this.contentBottomPadding = Constant.customfieldContentBottomPadding,
      this.hintSize = Constant.customfieldHintSize,
      this.prefixIcon,
      this.controller,
      this.suffixIcon});

  double contentLeftPadding;
  double contentRightPadding;
  double contentTopPadding;
  double contentBottomPadding;
  double bottomPadding;
  String hintText;
  Widget? prefixIcon;
  bool isObscureText;
  Widget? suffixIcon;
  double leftPadding;
  double rightPadding;
  double topPadding;
  double hintSize;
  void Function(String)? onChanged;
  void Function()? onTap;
  TextEditingController? controller;

  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            bottom: widget.bottomPadding,
            left: widget.leftPadding,
            right: widget.rightPadding,
            top: widget.topPadding),
        child: Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
              boxShadow: [Constant.boxShadow(color: AppTheme.greyColor)]),
          child: TextFormField(
            controller: widget.controller,
            onTap: widget.onTap,
            onChanged: widget.onChanged,
            validator: (value) =>
                value!.isNotEmpty ? null : Strings.invalidInput,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: widget.isObscureText,
            decoration: InputDecoration(
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    fontFamily: Strings.fontfamily,
                    fontSize: widget.hintSize,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textFieldHintColor),
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(
                    widget.contentLeftPadding,
                    widget.contentTopPadding,
                    widget.contentRightPadding,
                    widget.contentBottomPadding),
                fillColor: AppTheme.colorWhite,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.customFocusColor),
                    borderRadius:
                        BorderRadius.circular(Constant.customTextfieldCorner)),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(Constant.customTextfieldCorner)),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppTheme.colorTransprant),
                    borderRadius:
                        BorderRadius.circular(Constant.customTextfieldCorner))),
          ),
        ));
  }
}
