import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tourease/routes/app_routes.dart';
import 'package:tourease/theme/app_theme.dart';
import 'package:tourease/util/_string.dart';
import 'package:tourease/util/constants.dart';
import 'package:tourease/util/resources.dart';
import 'package:tourease/widgets/Custombutton.dart';
import 'package:tourease/widgets/custom_text.dart';
import 'package:tourease/widgets/glashMorphisam.dart';
import 'package:tourease/widgets/no_appbar.dart';

class EventDetail extends StatefulWidget {
  const EventDetail({super.key});

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  double height = Constant.zero;
  double width = Constant.zero;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: NoAppBar(
          colors: AppTheme.colorblack,
        ),
        body: _body());
  }

  _body() {
    return SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height / Constant.detailPageHeight,
                width: width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft:
                            Radius.circular(Constant.detailViewImageBorder),
                        bottomRight:
                            Radius.circular(Constant.detailViewImageBorder)),
                    image: DecorationImage(
                        image: AssetImage(detailImage), fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: Constant.topIconPadding,
                          right: Constant.topIconPadding,
                          top: Constant.topIconPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: Constant.imageBlurness,
                                    sigmaY: Constant.imageBlurness),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoute.HOME);
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(
                                        Constant.backIconPadding),
                                    height: Constant.topIconContainerRadius,
                                    width: Constant.topIconContainerRadius,
                                    decoration: Constant.deatailBoxDecoration,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: Constant
                                                .backIconLeftBottomTopPadding,
                                            right:
                                                Constant.backIconRightPadding,
                                            bottom: Constant
                                                .backIconLeftBottomTopPadding,
                                            top: Constant
                                                .backIconLeftBottomTopPadding),
                                        child: SvgPicture.asset(
                                          vector,
                                          color: AppTheme.colorWhite,
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height: Constant.topIconContainerRadius,
                                      width: Constant.topIconContainerRadius,
                                      decoration: Constant.deatailBoxDecoration,
                                      padding: const EdgeInsets.all(
                                          Constant.loveIconPadding),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          love,
                                        ),
                                      )),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: Constant.blureBoxLeftPadding,
                            right: Constant.blureBoxRightPadding,
                            bottom: Constant.blureBoxBottomPadding),
                        child: GlassmorPhism(
                          blure: Constant.blureBoxBlureness,
                          opacity: Constant.blureBoxopacity,
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: Constant.blureBoxContentPadding,
                                right: Constant.blureBoxContentPadding),
                            height: height * Constant.blureBoxHeight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                images(image: detailImage1),
                                images(image: detailImage2),
                                images(image: detailImage3),
                                image4(image: image2)
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: Constant.detailFirstLeftPadding,
                        right: Constant.detailFirstRightPadding,
                        top: Constant.detailFirstTopPadding,
                        bottom: Constant.detailFirstBottomPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: Strings.communityMeet,
                              fontSize: Constant.detailFirstHeadingSize,
                              fontWight: FontWeight.w900,
                            ),
                            CustomText(
                              topPadding:
                                  Constant.detailSecondHeadingTopPadding,
                              title: Strings.paris,
                              fontSize: Constant.detailSecondHeadingSize,
                              fontWight: FontWeight.bold,
                              color: AppTheme.greyColor,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomText(
                              title: Strings.dollar20,
                              fontSize: Constant.detailFirstHeadingSize,
                              fontWight: FontWeight.w800,
                            ),
                            CustomText(
                              topPadding:
                                  Constant.detailSecondHeadingTopPadding,
                              title: Strings.person,
                              fontSize: Constant.detailSecondHeadingSize,
                              fontWight: FontWeight.bold,
                              color: AppTheme.greyColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: Constant.detailMapLeftPadding),
                    child: Column(
                      children: [
                        detailMap(
                            title: Strings.redstoneStreet,
                            wordSpacing: Constant.detailMapTitleWordSpacing),
                        detailMap(
                            title: Strings.pM9_30,
                            wordSpacing: Constant.detailMapTimeTitleWordSpacing)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: Constant.detailMapImagePadding,
                        right: Constant.detailMapImagePadding),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoute.PAYMENT);
                      },
                      child: Container(
                        height: height * Constant.detailMapImageHeight,
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Constant.detailMapImageRadius),
                            image: const DecorationImage(
                                image: AssetImage(searchMap),
                                fit: BoxFit.cover)),
                        child: Center(
                          child: SizedBox(
                            height: height * Constant.bookButtonHeight,
                            child: CustomButton(
                                leftPadding: Constant.zero,
                                rightPadding: Constant.zero,
                                topPadding: Constant.bookButtonTopPadding,
                                backgroundColor: AppTheme.themeColor,
                                borderColor: AppTheme.themeColor,
                                buttonTitle: Strings.book,
                                height: height,
                                textColor: AppTheme.colorWhite),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  detailMap({required String title, required double wordSpacing}) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: Constant.detailMapRowBottomPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppTheme.detailMapBoxColor
                    .withOpacity(Constant.customOpacity),
                borderRadius:
                    BorderRadius.circular(Constant.detailMapCircleRadius)),
            padding: const EdgeInsets.only(
                right: Constant.detailMapCircleContentPadding,
                left: Constant.detailMapCircleContentPadding,
                top: Constant.detailMapCircleContentPadding,
                bottom: Constant.detailMapCircleContentTopPadding),
            child: SvgPicture.asset(
              map,
              height: Constant.detailMapCircleSize,
              width: Constant.detailMapCircleSize,
              color: AppTheme.detailMapBoxIconColor,
            ),
          ),
          CustomText(
            leftPadding: Constant.detailMapTitleLeftPadding,
            bottomPadding: Constant.detailMapTitleBottomPadding,
            title: title,
            fontSize: Constant.detailMapTitleSize,
            fontfamily: Strings.emptyString,
            wordSpacing: wordSpacing,
            fontWight: FontWeight.w500,
          )
        ],
      ),
    );
  }

  image4({required String image}) {
    return Container(
      height: Constant.blureMapBoxSize,
      width: Constant.blureMapBoxSize,
      child: GlassmorPhism(
        blure: Constant.blureMapBoxBlureness,
        opacity: Constant.blureMapBoxOpacity,
        radius: Constant.blureMapBoxRadius,
        child: Center(
          child: CustomText(
            title: '+ 5 ',
            fontSize: Constant.doublemoreImageTextSize,
            fontWight: FontWeight.bold,
            color: AppTheme.colorWhite,
          ),
        ),
      ),
      decoration: BoxDecoration(
          color: AppTheme.colorTransprant,
          borderRadius: BorderRadius.circular(Constant.blureMapBoxRadius),
          image: DecorationImage(image: AssetImage(image))),
    );
  }

  images({required String image}) {
    return Container(
      height: Constant.blureMapBoxSize,
      width: Constant.blureMapBoxSize,
      decoration: BoxDecoration(
          color: AppTheme.colorTransprant,
          borderRadius: BorderRadius.circular(Constant.blureMapBoxRadius),
          image: DecorationImage(image: AssetImage(image))),
    );
  }
}
