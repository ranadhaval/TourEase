import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/routes/app_routes.dart';
import 'package:tourease/theme/app_theme.dart';
import 'package:tourease/util/_string.dart';
import 'package:tourease/util/constants.dart';
import 'package:tourease/widgets/Custombutton.dart';
import 'package:tourease/widgets/custom_text.dart';
import 'package:tourease/widgets/no_appbar.dart';
import '../../widgets/app_logo.dart';

class Option extends StatefulWidget {
  const Option({super.key});

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  double? height;
  double? width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: NoAppBar(),
      body: Column(
        children: [
          AppLogo(),
          Constant.sizedBoxHeight15,
          SizedBox(
            width: width! / Constant.signintoAppToenjoyBoxtwidth,
            child: CustomText(
              title: Strings.signintoAppToenjoy,
              fontWight: FontWeight.bold,
              fontSize: Constant.signintoAppToenjoyTextSize,
              color: Colors.black45,
              height: Constant.signintoAppToenjoyBoxtheight,
              textAlign: TextAlign.center,
            ),
          ),
          CustomButton(
              onTap: () {
                Get.toNamed(AppRoute.LOGIN);
              },
              backgroundColor: AppTheme.themeColor,
              borderColor: AppTheme.themeColor,
              buttonTitle: Strings.login,
              height: Constant.customButtonHeight,
              textColor: AppTheme.colorWhite),
          CustomButton(
              onTap: () {
                Get.toNamed(AppRoute.SIGNUP);
              },
              backgroundColor: AppTheme.colorWhite,
              borderColor: AppTheme.themeColor,
              buttonTitle: Strings.signUp,
              height: Constant.customButtonHeight,
              textColor: AppTheme.themeColor)
        ],
      ),
    );
  }
}
