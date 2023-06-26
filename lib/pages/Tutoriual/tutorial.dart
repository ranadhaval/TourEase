import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tourease/pages/Tutoriual/tutorial_controller.dart';
import 'package:tourease/theme/app_theme.dart';
import 'package:tourease/util/_string.dart';
import 'package:tourease/util/constants.dart';
import 'package:tourease/util/resources.dart';
import 'package:tourease/widgets/custom_text.dart';
import 'package:tourease/widgets/no_appbar.dart';
import '../OptionCenter/option.dart';


class Tutorial extends StatefulWidget {
  const Tutorial({super.key});

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  double height = Constant.zero;
  double width = Constant.zero;
  bool? isPotrait;

  final tutorialController = Get.put(TutorialController());

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return GetBuilder(
        init: tutorialController,
        builder: (con) {
          return Scaffold(
              appBar: NoAppBar(colors: AppTheme.tutorialAppbarColor),
              body: Stack(children: [
                Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            colors: AppTheme.tutorialBgColor)),
                    child: PageView(
                        onPageChanged: (index) {
                          tutorialController.index_ = index;
                          tutorialController.update();
                        },
                        controller: tutorialController.pageController,
                        children: [
                          skipPage1(),
                          skipPage2(
                              image: page2,
                              title: Strings.categories,
                              titleDiscription: Strings.page2Text),
                          skipPage2(
                              title: Strings.plans,
                              titleDiscription: Strings.page3Text,
                              image: page3),
                          skipPage2(
                              title: Strings.profileSection,
                              titleDiscription: Strings.page4Text,
                              image: page4),
                          skipPage2(
                              title: Strings.chat,
                              titleDiscription: Strings.page5Text,
                              image: page5)
                        ])),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: Constant.dotBottomPadding,
                      left: Constant.dotLeftPadding,
                      right: Constant.dotRightPadding),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      highlightColor: AppTheme.colorTransprant,
                      splashColor: AppTheme.colorTransprant,
                      onTap: () {
                        if (tutorialController.index_ != Constant.INT_FOUR) {
                          tutorialController.pageController.nextPage(
                              duration: const Duration(
                                  milliseconds: Constant.miliseconds150),
                              curve: Curves.bounceInOut);
                        } else {
                          Get.to(const Option());
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmoothPageIndicator(
                            count: Constant.INT_FIVE,
                            effect: const ScrollingDotsEffect(
                                spacing: Constant.dotSpacing,
                                dotHeight: Constant.dotHeight,
                                dotWidth: Constant.dotWidth,
                                radius: Constant.dotRadius,
                                dotColor: AppTheme.dotColor,
                                activeDotColor: AppTheme.colorWhite),
                            controller: tutorialController.pageController,
                          ),
                          Row(
                            children: [
                              InkWell(
                                // onTap: () {
                                //   if (tutorialController.index_ !=
                                //       Constant.INT_FOUR) {
                                //     tutorialController.pageController.nextPage(
                                //         duration: const Duration(
                                //             milliseconds:
                                //                 Constant.miliseconds150),
                                //         curve: Curves.bounceInOut);
                                //   } else {
                                //     Get.to(const Option());
                                //   }
                                // },
                                child: CustomText(
                                  title: tutorialController.index_ >=
                                              Constant.INT_ONE &&
                                          tutorialController.index_ <=
                                              Constant.INT_THREE
                                      ? Strings.next
                                      : tutorialController.index_ ==
                                              Constant.INT_FOUR
                                          ? Strings.finsh
                                          : Strings.getstarted,
                                  fontWight: FontWeight.bold,
                                  color: AppTheme.colorblue,
                                  fontfamily: Strings.emptyString,
                                  wordSpacing: Constant.wordspacing,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward,
                                size: Constant.getstartedArrowSize,
                                color: AppTheme.colorblue,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ]));
        });
  }

  Widget skipPage2(
      {required String title,
      required String titleDiscription,
      required String image}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: Constant.skip2LeftPadding,
              right: Constant.skip2RightPadding,
              top: Constant.skip2TopPadding),
          child: CircleAvatar(
            radius: height * Constant.skip2CircleRadius,
            backgroundColor: AppTheme.colorWhite,
            child: Padding(
              padding: const EdgeInsets.all(Constant.FIVE),
              child: CircleAvatar(
                radius: height * Constant.skip2CircleRadius,
                backgroundImage: AssetImage(image),
              ),
            ),
          ),
        ),
        CustomText(
          title: title,
          height: Constant.skip2TextHeight,
          fontWight: FontWeight.bold,
          color: AppTheme.colorWhite,
          fontSize: Constant.skip2TitleSize,
        ),
        Padding(
          padding: const EdgeInsets.all(Constant.skip2TitleDiscriptionPadding),
          child: CustomText(
              height: Constant.skip2TextHeight,
              fontWight: FontWeight.w300,
              color: AppTheme.colorWhite,
              textAlign: TextAlign.center,
              title: titleDiscription),
        )
      ],
    );
  }

  Widget skipPage1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: Constant.skip1TopPadding,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: Constant.skip1LeftPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: Strings.journyToYour,
                  fontWight: FontWeight.bold,
                  fontSize: Constant.skip1FistHeadingSize,
                  color: AppTheme.colorWhite,
                ),
                CustomText(
                  title: Strings.dreamCulture,
                  fontWight: FontWeight.w400,
                  fontSize: Constant.skip1SecondHeadingSize,
                  color: AppTheme.colorWhite,
                  height: Constant.skip1SecondHeadingHeight,
                ),
                CustomText(
                  title: Strings.signintoAppToenjoy,
                  fontWight: FontWeight.w300,
                  fontSize: Constant.skip1ThirdHeadingSize,
                  color: AppTheme.colorWhite,
                  height: Constant.skip1ThirdHeadingHeight,
                ),
                CustomText(
                  title: Strings.toEnjoy,
                  fontWight: FontWeight.w300,
                  fontSize: Constant.skip1FourthHeadingSize,
                  color: AppTheme.colorWhite,
                  height: Constant.skip1FourthHeadingHeight,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: Constant.userImagePadding),
          child: Container(
            height: height / Constant.userImageHeight,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(userLogo))),
          ),
        ),
      ],
    );
  }
}
