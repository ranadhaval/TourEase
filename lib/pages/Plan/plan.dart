// ignore_for_file: must_be_immutable
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tourease/pages/Dashboard/home_controller.dart';
import 'package:tourease/pages/Plan/plan_controller.dart';
import 'package:tourease/routes/app_routes.dart';
import 'package:tourease/theme/app_theme.dart';
import 'package:tourease/util/_string.dart';
import 'package:tourease/util/constants.dart';
import 'package:tourease/util/resources.dart';
import 'package:tourease/widgets/_appbar.dart';
import 'package:tourease/widgets/custom_text.dart';
import 'package:tourease/widgets/glashMorphisam.dart';
import 'package:tourease/widgets/no_appbar.dart';

class Plan extends StatefulWidget {
  const Plan({key});

  @override
  State<Plan> createState() => _PlanState();
}

class _PlanState extends State<Plan> with SingleTickerProviderStateMixin {
  double height = Constant.zero;
  double width = Constant.zero;
  HomeController homeController = Get.put(HomeController());
  final planController = Get.put(PlanController());
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return GetBuilder(
        init: homeController,
        builder: (context) {
          return GetBuilder(
              init: planController,
              builder: (_) {
                return Scaffold(appBar: NoAppBar(), body: _body());
              });
        });
  }

  _body() {
    return DefaultTabController(
      length: Constant.INT_THREE,
      child: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.only(top: Constant.planBodyTopPadding),
          child: Column(
            children: [
              CustomAppBar(
                  onTap: () {
                      homeController.index = Constant.INT_ONE;
            homeController.update();
                  },
                  title: Strings.plans,
                  space: Constant.SIZE50,
                  leftPadding: Constant.planAppbarLeftPadding,
                  rightPadding: Constant.planAppbarRightPadding,
                  bottomPadding: Constant.planAppbarBottomPadding),
              Row(
                children: [
                  SizedBox(
                    width: width / Constant.tabBarWidth,
                    child: TabBar(
                        indicatorWeight: Constant.tabBarIndicatorWeight,
                        indicatorColor: AppTheme.colorblack,
                        indicatorPadding: const EdgeInsets.only(
                            bottom: Constant.tabBarIndicatorPadding),
                        unselectedLabelColor: AppTheme.greyColor,
                        controller: planController.tabController,
                        padding: const EdgeInsets.only(
                          left: Constant.tabBarContentPadding,
                        ),
                        indicatorSize: TabBarIndicatorSize.label,
                        labelPadding: EdgeInsets.zero,
                        tabs: const [
                          Tab(
                            child: Text(
                              Strings.booking,
                              style: Constant.tabTextStyle,
                            ),
                          ),
                          Tab(
                            child: Text(
                              Strings.liked,
                              style: Constant.tabTextStyle,
                            ),
                          ),
                          Tab(
                            child: Text(
                              Strings.plans,
                              style: Constant.tabTextStyle,
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                    controller: planController.tabController,
                    children: [bookingList(), likedList(), planList()]),
              )
            ],
          ),
        ),
      ),
    );
  }

  planList() {
    return Padding(
      padding: const EdgeInsets.only(
        left: Constant.searchTileLeftPadding,
        right: Constant.searchTileRightPadding,
      ),
      child: SizedBox(
        height: height * Constant.searchBodyHeight,
        child: ListView.builder(
          padding: EdgeInsets.only(
              left: Constant.searchTileListLeftPadding,
              bottom: height * Constant.searchTileListBottomPadding,
              right: Constant.searchTileListRightPadding,
              top: Constant.searchTileListTopPadding),
          itemCount: planController.planedList.length,
          itemBuilder: (context, index) {
            return planedTile(index);
          },
        ),
      ),
    );
  }

  planedTile(index) {
    return Column(
      children: [
        Container(
          height: height / Constant.FIVE,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Constant.planImageRadius),
              image: DecorationImage(
                  image: AssetImage(
                    planController.planedList[index].image,
                  ),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.all(Constant.planImageTopBoxPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlassmorPhism(
                    blure: Constant.planImageTopBoxBlurness,
                    opacity: Constant.planImageTopBoxOpacity,
                    radius: Constant.planImageTopBoxRadius,
                    child: SizedBox(
                      height: Constant.planImageTopBoxHeight,
                      width: Constant.planImageTopBoxWidth,
                      child: Center(
                          child: CustomText(
                        title: ' 4 Save ',
                        color: AppTheme.colorWhite,
                        fontfamily: Strings.emptyString,
                        fontWight: FontWeight.bold,
                      )),
                    ))
              ],
            ),
          ),
        ),
        Row(
          children: [
            CustomText(
                topPadding: Constant.tabBarViewTitleTopPadding,
                bottomPadding: Constant.tabBarViewTitleBottomPadding,
                fontSize: Constant.tabBarViewTitleSize,
                fontWight: FontWeight.w900,
                title: planController.planedList[index].title)
          ],
        ),
      ],
    );
  }

  bookingList() {
    return Padding(
      padding: const EdgeInsets.only(
        left: Constant.bookingTileLeftPadding,
        right: Constant.bookingTileRightPadding,
      ),
      child: SizedBox(
        height: height * Constant.searchBodyHeight,
        child: ListView.builder(
          padding: EdgeInsets.only(
              left: Constant.searchTileListLeftPadding,
              bottom: height * Constant.searchTileListBottomPadding,
              right: Constant.searchTileListRightPadding,
              top: Constant.searchTileListTopPadding),
          itemCount: Constant.INT_THREE,
          itemBuilder: (context, index) {
            return bookingTile(index);
          },
        ),
      ),
    );
  }

  bookingTile(index) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: Constant.blurSigmaX, sigmaY: Constant.blurSigmaY),
        ),
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            margin: const EdgeInsets.all(Constant.searchTileMargin),
            padding: const EdgeInsets.only(
                bottom: Constant.searchTileContentBottomPadding),
            decoration: Constant.boxDecoration,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: Constant.bookingTileImageRightPadding,
                          top: Constant.bookingTileTopRightPadding),
                      child: Container(
                        height: height * Constant.searchTileImageHeight,
                        width: width / Constant.searchTileImageWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Constant.searchTileImageCircularRadius),
                            image: DecorationImage(
                                image: AssetImage(
                                    planController.likedlist[index].image),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: planController.likedlist[index].placeName,
                          fontSize: Constant.searchTileTitleSize,
                          color: AppTheme.colorblack,
                          fontWight: FontWeight.w900,
                        ),
                        CustomText(
                          topPadding: Constant.searchTilFirsteSubTitleSize,
                          title: planController.likedlist[index].time,
                          fontSize: Constant.searchTileSubTitleSize,
                          color: AppTheme.tripCardLocationColor,
                          fontWight: FontWeight.bold,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: Constant.tripCardLocationPadding),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: AppTheme.tripCardLocationColor,
                                size: Constant.locationIconSize,
                              ),
                              CustomText(
                                title: planController.likedlist[index].location,
                                fontSize: Constant.searchTileSubTitleSize,
                                color: AppTheme.tripCardLocationColor,
                                fontWight: FontWeight.w400,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: Constant.ongoingButtonLeftPadding,
                      right: Constant.ongoingButtonRightPadding,
                      top: Constant.ongoingButtonTopPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                              height: Constant.ongoingButtonHeight,
                              width: Constant.ongoingButtonHWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    Constant.ongoingButtonBorderRadius),
                                color: AppTheme.themeColor.withOpacity(
                                    Constant.ongoingButtonColorOpacity),
                              ),
                              child: Center(
                                child: CustomText(
                                  title: Strings.ongoing,
                                  fontSize: Constant.ongoingButtonTextSize,
                                  color: AppTheme.colorWhite,
                                ),
                              )),
                          CustomText(
                            topPadding: Constant.moreTextTopPadding,
                            title: Strings.more,
                            fontSize: Constant.moreTextSize,
                            fontfamily: Strings.emptyString,
                            color: AppTheme.themeColor,
                            fontWight: FontWeight.w400,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  likedList() {
    return Padding(
      padding: const EdgeInsets.only(
        left: Constant.searchTileLeftPadding,
        right: Constant.searchTileRightPadding,
      ),
      child: SizedBox(
        height: height * Constant.searchBodyHeight,
        child: ListView.builder(
          padding: EdgeInsets.only(
              left: Constant.searchTileListLeftPadding,
              bottom: height * Constant.searchTileListBottomPadding,
              right: Constant.searchTileListRightPadding,
              top: Constant.searchTileListTopPadding),
          itemCount: planController.likedlist.length,
          itemBuilder: (context, index) {
            return likedTile(index);
          },
        ),
      ),
    );
  }

  likedTile(index) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: Constant.blurSigmaX, sigmaY: Constant.blurSigmaY),
        ),
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            margin: const EdgeInsets.all(Constant.searchTileMargin),
            padding: const EdgeInsets.only(
                left: Constant.searchTileContentLeftPadding,
                right: Constant.searchTileContentRightPadding,
                bottom: Constant.searchTileContentBottomPadding),
            decoration: Constant.boxDecoration,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: Constant.searchTileImageRightPadding,
                          top: Constant.searchTileImageTopPadding),
                      child: Container(
                        height: height * Constant.searchTileImageHeight,
                        width: width / Constant.searchTileImageWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Constant.searchTileImageCircularRadius),
                            image: DecorationImage(
                                image: AssetImage(
                                    planController.likedlist[index].image),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: Constant.searchTileDiscriptionBottomPadding,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: planController.likedlist[index].placeName,
                            fontSize: Constant.searchTileTitleSize,
                            color: AppTheme.colorblack,
                            fontWight: FontWeight.w900,
                          ),
                          CustomText(
                            topPadding: Constant.searchTilFirsteSubTitleSize,
                            title: planController.likedlist[index].time,
                            fontSize: Constant.searchTileSubTitleSize,
                            color: AppTheme.tripCardLocationColor,
                            fontWight: FontWeight.bold,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: Constant.tripCardLocationPadding),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: AppTheme.tripCardLocationColor,
                                  size: Constant.locationIconSize,
                                ),
                                CustomText(
                                  title:
                                      planController.likedlist[index].location,
                                  fontSize: Constant.searchTileSubTitleSize,
                                  color: AppTheme.tripCardLocationColor,
                                  fontWight: FontWeight.w400,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: Constant.loveIconTopPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: Constant.loveIconCircleRadius,
                            width: Constant.loveIconCircleRadius,
                            padding: const EdgeInsets.all(
                                Constant.loveIconAllPadding),
                            decoration: Constant.boxDecoration,
                            child: SvgPicture.asset(
                              love,
                              height: Constant.loveIconSize,
                              width: Constant.loveIconSize,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
