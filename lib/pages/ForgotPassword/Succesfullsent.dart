import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tourease/theme/app_theme.dart';
import 'package:tourease/util/_string.dart';
import 'package:tourease/util/constants.dart';
import 'package:tourease/util/resources.dart';
import 'package:tourease/widgets/Custombutton.dart';
import 'package:tourease/widgets/custom_text.dart';

class SuccessfullSent extends StatefulWidget {
  const SuccessfullSent({super.key});

  @override
  State<SuccessfullSent> createState() => _SuccessfullSentState();
}

class _SuccessfullSentState extends State<SuccessfullSent> {
  final String data = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.successFullySentColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: Constant.successfullTopPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: Constant.successfullTopPadding,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      title: Strings.successFull,
                      fontfamily: Strings.emptyString,
                      fontSize: Constant.forgotTextSize,
                      fontWight: FontWeight.w500,
                      wordSpacing: Constant.zero,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: Constant.successfullCircleTopPadding),
                      child: Container(
                        height: Constant.successfullCircleHeight,
                        width: Constant.successfullCircleWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Constant.successfullCircleRadius),
                            gradient:
                                LinearGradient(colors: AppTheme.circleBgColor)),
                        child: Center(
                          child: SvgPicture.asset(
                            right,
                            height: Constant.rightIconHeight,
                            width: Constant.rightIconWidth,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: Constant.successfullSubTitleTopPadding,
                          left: Constant.successfullSubTitleLeftPadding,
                          right: Constant.successfullSubTitleRightPadding,
                          bottom: Constant.successfullSubTitleBottomPadding),
                      child: CustomText(
                          textAlign: TextAlign.center,
                          height: Constant.successfullSubTitleHeight,
                          fontfamily: Strings.emptyString,
                          fontWight: FontWeight.w300,
                          fontSize: Constant.successfullSubTitleSize,
                          color: AppTheme.successfullSubTitleColor,
                          title: data.toString()),
                    ),
                  ],
                ),
              ),
              CustomButton(
                bottomPadding: Constant.okayButtonBottomPadding,
                backgroundColor: AppTheme.themeColor,
                borderColor: AppTheme.themeColor,
                textColor: AppTheme.colorWhite,
                buttonTitle: Strings.okay,
                onTap: () async {
                  Get.back();
                },
                height: Constant.customButtonHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
