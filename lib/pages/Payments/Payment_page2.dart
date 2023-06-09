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

class PaymentPage2 extends StatefulWidget {
  const PaymentPage2({super.key});

  @override
  State<PaymentPage2> createState() => _PaymentPage2State();
}

class _PaymentPage2State extends State<PaymentPage2> {
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
                          Get.back();
                        },
                      ),
                      CustomText(
                        topPadding: Constant.payment2TitleTopPadding,
                        bottomPadding: Constant.payment2TitleRightPadding,
                        leftPadding: Constant.payment2TitleLeftPadding,
                        title: Strings.paymentMethod,
                        fontfamily: Strings.emptyString,
                        fontSize: Constant.payment2TitleSize,
                        fontWight: FontWeight.w500,
                      ),
                      SvgPicture.asset(
                        cardExample,
                        height: height * Constant.paymentCardHeight,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: Constant.addNewCardRightPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(
                              title: Strings.addNewCard,
                              fontfamily: Strings.emptyString,
                              fontSize: Constant.addNewCardSize,
                              fontWight: FontWeight.w400,
                              rightPadding:
                                  Constant.addNewCardTitleSpaceRightPadding,
                            ),
                            SvgPicture.asset(
                              addNewCardPointer,
                              height: Constant.addNewCardPointerIconSize,
                              width: Constant.addNewCardPointerIconSize,
                              color: AppTheme.colorblack,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Constant.SIZE80,
                      ),
                      priceTile(title: Strings.subTotal, price: '\$50.00'),
                      priceTile(title: Strings.tax, price: '\$4.50'),
                      priceTile(title: Strings.total, price: '\$54.50'),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                        onTap: () {
                          Get.toNamed(AppRoute.SUCCESSFULL, arguments: [
                            'Your Payment completed succesfully!'
                          ]);
                        },
                        bottomPadding: Constant.payButtonBottomPadding,
                        backgroundColor: AppTheme.themeColor,
                        borderColor: AppTheme.themeColor,
                        buttonTitle: Strings.pay,
                        textColor: AppTheme.colorWhite),
                  )
                ],
              ),
            ),
          );
        });
  }

  priceTile({required String title, required String price}) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Constant.priceTileLeftPadding,
          right: Constant.priceTileRightPadding,
          bottom: Constant.priceTileBottomPadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                title: title,
                fontWight: FontWeight.bold,
                fontfamily: Strings.emptyString,
                fontSize: Constant.priceTileTitleSize,
                wordSpacing: Constant.priceTileTitleWordSpacing,
              ),
              CustomText(
                title: price,
                fontWight: FontWeight.w500,
                fontfamily: Strings.emptyString,
                fontSize: Constant.priceTilePriceSize,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
