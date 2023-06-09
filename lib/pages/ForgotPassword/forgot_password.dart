import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/routes/app_routes.dart';
import 'package:tourease/theme/app_theme.dart';
import 'package:tourease/util/_string.dart';
import 'package:tourease/util/constants.dart';
import 'package:tourease/widgets/Custom_Textfield.dart';
import 'package:tourease/widgets/Custombutton.dart';
import 'package:tourease/widgets/custom_text.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.forgotPasswordColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: Constant.forgotTopPadding,
          ),
          child: Column(
            children: [
              CustomText(
                title: Strings.forgotPassword,
                fontfamily: Strings.emptyString,
                fontSize: Constant.forgotTextSize,
                fontWight: FontWeight.w500,
                wordSpacing: Constant.zero,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: Constant.forgotSubtitleTopPadding,
                    left: Constant.forgotSubtitleLeftPadding,
                    right: Constant.forgotSubtitleRightPadding,
                    bottom: Constant.forgotSubtitleBottomPadding),
                child: CustomText(
                    textAlign: TextAlign.center,
                    height: Constant.forgotSubtitleHeight,
                    fontfamily: Strings.emptyString,
                    fontSize: Constant.forgotSubtitleSize,
                    color: AppTheme.forgotSubtitleColor,
                    title: Strings.enterEmailornumbertoreset),
              ),
              CustomTextFeild(
                hintText: Strings.enterEmailOrNumber,
                prefixIcon: const Icon(
                  Icons.lock_reset_outlined,
                  size: Constant.resetIconSize,
                  color: Colors.black38,
                ),
              ),
              CustomButton(
                topPadding: Constant.sendOtpButtonTopPadding,
                backgroundColor: AppTheme.themeColor,
                borderColor: AppTheme.themeColor,
                textColor: AppTheme.colorWhite,
                buttonTitle: Strings.sendOtp,
                onTap: () async {
                  Get.toNamed(AppRoute.SUCCESSFULL,
                      arguments: [Strings.resetEmailsentSuccesfully]);
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
