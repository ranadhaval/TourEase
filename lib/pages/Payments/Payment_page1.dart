import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tourease/pages/Payments/payment_controller.dart';
import 'package:tourease/routes/app_routes.dart';
import 'package:tourease/theme/app_theme.dart';
import 'package:tourease/util/_string.dart';
import 'package:tourease/util/constants.dart';
import 'package:tourease/util/resources.dart';
import 'package:tourease/widgets/Custombutton.dart';
import 'package:tourease/widgets/_appbar.dart';
import 'package:tourease/widgets/custom_text.dart';
import 'package:tourease/widgets/no_appbar.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  double height = Constant.zero;
  double width = Constant.zero;

  final paymentController = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return GetBuilder(
        init: paymentController,
        builder: (context) {
          return Scaffold(
            backgroundColor: AppTheme.paymentPageColor,
            appBar: NoAppBar(),
            body: Padding(
              padding: const EdgeInsets.only(
                  left: Constant.paymentBodyLeftPadding,
                  right: Constant.paymentBodyRightPadding,
                  top: Constant.paymentBodyTopPadding),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppBar(
                        title: Strings.payment_,
                        space: Constant.SIZE15,
                        onTap: () {
                          Get.offNamed(AppRoute.DETAIL_SCREEN);
                        },
                      ),
                      CustomText(
                        topPadding: Constant.paymentTitleTopPadding,
                        leftPadding: Constant.paymentTitleLeftPadding,
                        bottomPadding: Constant.paymentTitleBottomPadding,
                        title: Strings.paymentMethod,
                        fontfamily: Strings.emptyString,
                        fontSize: Constant.paymentTitleSize,
                        fontWight: FontWeight.w500,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: Constant.paymentBoxLeftPadding,
                            right: Constant.paymentBoxRightPadding),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppTheme.colorWhite,
                              borderRadius: BorderRadius.circular(
                                  Constant.paymentBoxRadius)),
                          padding: const EdgeInsets.only(
                              left: Constant.paymentOptionBoxContentLeftPadding,
                              right:
                                  Constant.paymentOptionBoxContentRightPadding,
                              bottom:
                                  Constant.paymentOptionBoxContentBottomPadding,
                              top: Constant.paymentOptionBoxContentTopPadding),
                          child: Column(
                            children: [
                              paymentOptionTile(
                                  title: Strings.cards,
                                  icon: creditCard,
                                  height: Constant.creditcardIconSize,
                                  width: Constant.creditcardIconSize,
                                  onTap: () {
                                    paymentController.index = Constant.INT_ONE;
                                    paymentController.update();
                                  },
                                  id: Constant.INT_ONE,
                                  topPadding: Constant.creditcardIconTopPadding,
                                  bottomPadding:
                                      Constant.creditcardIconBottomPadding,
                                  leftPadding:
                                      Constant.creditcardIconLeftPadding),
                              paymentOptionTile(
                                  title: Strings.netBanking,
                                  icon: bank,
                                  height: Constant.bankIconSize,
                                  width: Constant.bankIconSize,
                                  topPadding: Constant.bankIconTopPadding,
                                  bottomPadding: Constant.bankIconBottomPadding,
                                  leftPadding: Constant.bankIconLeftPadding,
                                  onTap: () {
                                    paymentController.index = Constant.INT_TWO;
                                    paymentController.update();
                                  },
                                  id: Constant.INT_TWO),
                              paymentOptionTile(
                                  title: Strings.upiBhim,
                                  noNeedDevider: true,
                                  icon: upiBhim,
                                  height: Constant.upiIconSize,
                                  width: Constant.upiIconSize,
                                  topPadding: Constant.upiIconTopPadding,
                                  bottomPadding: Constant.upiIconBottomPadding,
                                  onTap: () {
                                    paymentController.index =
                                        Constant.INT_THREE;
                                    paymentController.update();
                                  },
                                  id: Constant.INT_THREE,
                                  leftPadding: Constant.upiIconLeftPadding),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                        onTap: () {
                          Get.toNamed(AppRoute.PAYMENT2);
                        },
                        bottomPadding: Constant.nextButtonBottomPadding,
                        backgroundColor: AppTheme.themeColor,
                        borderColor: AppTheme.themeColor,
                        buttonTitle: Strings.next_,
                        textColor: AppTheme.colorWhite),
                  )
                ],
              ),
            ),
          );
        });
  }

  paymentOptionTile(
      {bool noNeedDevider = false,
      void Function()? onTap,
      required int id,
      required String icon,
      required double height,
      required double width,
      required double topPadding,
      required String title,
      required double bottomPadding,
      required double leftPadding}) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.only(
                top: topPadding, bottom: bottomPadding, left: leftPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      icon,
                      width: height,
                      height: height,
                      color: AppTheme.themeColor,
                    ),
                    CustomText(
                      leftPadding: Constant.paymentOptionTileTitleLeftPadding,
                      title: title,
                      fontSize: Constant.paymentOptionTileTitleSize,
                      fontfamily: Strings.emptyString,
                      fontWight: FontWeight.w400,
                    )
                  ],
                ),
                paymentController.index == id
                    ? CircleAvatar(
                        radius:
                            Constant.paymentOptionTileselectionPointerRadius,
                        child: CircleAvatar(
                          radius:
                              Constant.paymentOptionTileselectionPointerRadius2,
                          backgroundColor: AppTheme.buttonThemeColor,
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
        noNeedDevider
            ? Container()
            : Container(
                height: Constant.settingTileDividerHeight,
                color: AppTheme.greyColor
                    .withOpacity(Constant.paymentDividerOpacity),
              ),
      ],
    );
  }
}
