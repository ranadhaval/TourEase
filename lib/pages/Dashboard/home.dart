import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tourease/pages/Connects/connects.dart';
import 'package:tourease/pages/Dashboard/home_controller.dart';
import 'package:tourease/pages/Plan/plan.dart';
import 'package:tourease/pages/Profile/profile.dart';
import 'package:tourease/routes/app_routes.dart';
import 'package:tourease/theme/app_theme.dart';
import 'package:tourease/util/_string.dart';
import 'package:tourease/util/constants.dart';
import 'package:tourease/util/resources.dart';
import 'package:tourease/widgets/Custom_Textfield.dart';
import 'package:tourease/widgets/custom_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double height = Constant.zero;
  double width = Constant.zero;

  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetBuilder(
        init: homeController,
        builder: (_) {
          return Scaffold(body: _body());
        });
  }

  _body() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [
          Builder(builder: (context) {
            switch (homeController.index) {
              case Constant.INT_ONE:
                return _home();
              case Constant.INT_TWO:
                return const Plan();
              case Constant.INT_THREE:
                return Profile(
                  homeController: homeController,
                );
              case Constant.INT_FOUR:
                return const Connect();
              default:
                return _home();
            }
          }),
          homeController.isSearchOpened &&
                  homeController.index == Constant.INT_ONE
              ? Padding(
                  padding: const EdgeInsets.only(
                      bottom: Constant.newMapFloatingButtonBottomPadding,
                      right: Constant.newMapFloatingButtonRightPadding),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: SvgPicture.asset(
                        newMap,
                        width: Constant.newMapIconSize,
                        height: Constant.newMapIconSize,
                      ),
                    ),
                  ),
                )
              : Container(),
          bottomNavBar()
        ],
      ),
    );
  }

  List<String> images = [image1, image2, image3, image4, image5, image6];

  searchedTileList(List<String> images) {
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
          itemCount: images.length + 10,
          itemBuilder: (context, index) {
            return searchTile(index);
          },
        ),
      ),
    );
  }

  searchTile(index) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: Constant.blurSigmaX, sigmaY: Constant.blurSigmaY),
        ),
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();

            Get.toNamed(AppRoute.DETAIL_SCREEN);
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
                                image:
                                    AssetImage(images[index % images.length]),
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
                            title: 'Event culture',
                            fontSize: Constant.searchTileTitleSize,
                            color: AppTheme.colorblack,
                            fontWight: FontWeight.w900,
                          ),
                          CustomText(
                            topPadding: Constant.searchTilFirsteSubTitleSize,
                            title: '12 Feb - 1 March',
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
                                  title: Strings.parisEurope,
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

  tripCardTile({required String image}) {
    double heightx = MediaQuery.of(context).size.height;
    double widthy = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: Constant.blurSigmaX, sigmaY: Constant.blurSigmaY),
        ),
        Container(
          padding: const EdgeInsets.all(Constant.tripCardPadding),
          margin: const EdgeInsets.all(Constant.tripCardMargin),
          decoration: Constant.boxDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: heightx * Constant.tripCardHeight,
                width: widthy / Constant.tripCardWidth,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Constant.imageCardRadius),
                    color: AppTheme.colorWhite,
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: Constant.tripCardTitleLeftPadding,
                    right: Constant.tripCardTitleRightPadding,
                    top: Constant.tripCardTitleTopPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          title: Strings.sighting,
                          fontfamily: Strings.emptyString,
                          fontWight: FontWeight.bold,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: Constant.tripCardLocationPadding),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            map,
                            height: Constant.tripCardLocationIconHeight,
                            width: Constant.tripCardLocationIconWidth,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: Constant.tripCardLocationTitlePadding),
                            child: CustomText(
                              title: Strings.parisEurope,
                              fontSize: Constant.tripCardLocationTitleSize,
                              color: AppTheme.tripCardLocationColor,
                              fontWight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  cardButton({required image, required String title}) {
    return Padding(
      padding: const EdgeInsets.only(
          top: Constant.homeCardButtonTopPadding,
          left: Constant.homeCardButtonLeftPadding,
          right: Constant.homeCardButtonRightPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppTheme.colorWhite,
                borderRadius: BorderRadius.circular(Constant.cardButtonRadius),
                boxShadow: [
                  Constant.boxShadow(
                      color: AppTheme.colorblack,
                      blurradius: Constant.zero,
                      dy: Constant.zero),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(Constant.homeCardButtonPadding),
              child: SizedBox(
                child: SvgPicture.asset(
                  image,
                  height: Constant.homeCardButtonHeight,
                  width: Constant.homeCardButtonWidth,
                ),
              ),
            ),
          ),
          titles(title: title, padding: Constant.categoriesTitlePadding),
        ],
      ),
    );
  }

  mainTitle(
      {double topPadding = Constant.categoriesPadding,
      double leftPadding = 0,
      double rightPadding = 0,
      required String title}) {
    return Padding(
      padding: EdgeInsets.only(
          top: topPadding, left: leftPadding, right: rightPadding),
      child: CustomText(
        title: title,
        fontWight: FontWeight.w900,
      ),
    );
  }

  titles(
      {required String title,
      double padding = Constant.zero,
      double fontSize = Constant.categoriesTitleSize}) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: CustomText(
        title: title,
        fontSize: fontSize,
        fontfamily: Strings.emptyString,
        fontWight: FontWeight.w500,
      ),
    );
  }

  _home() {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: homeController.isSearchOpened
                  ? AppTheme.homeBgColor2
                  : AppTheme.homeBgColor)),
      child: Padding(
        padding: Constant.constantPadding(Constant.SIZE100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: Constant.homeFirstHeadingPadding,
                    right: Constant.homeFirstHeadingPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: homeController.isSearchOpened
                              ? Strings.whatDo
                              : Strings.whereDo,
                          fontfamily: Strings.emptyString,
                          fontSize: Constant.homeFirstHeadingSize,
                          fontWight: FontWeight.w400,
                        ),
                        CustomText(
                          fontSize: Constant.homeFirstHeadingSize,
                          height: Constant.homeFirstHeadingHeight,
                          fontWight: FontWeight.w600,
                          title: homeController.isSearchOpened
                              ? Strings.youWantToSee
                              : Strings.youWantToGo,
                          fontfamily: Strings.emptyString,
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: Constant.circleImageRadius,
                      child: Image(
                          image: AssetImage(
                        imageUser,
                      )),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: Constant.INT_SIX,
                    child: CustomTextFeild(
                      hintSize: homeController.isSearchOpened
                          ? Constant.hintSearchedSize
                          : Constant.customfieldHintSize,
                      leftPadding: Constant.homeFirstHeadingPadding,
                      onTap: () {
                        homeController.isSearchOpened = true;
                      },
                      contentRightPadding: homeController.isSearchOpened
                          ? Constant.zero
                          : Constant.isSearchedRightPadding,
                      rightPadding: homeController.isSearchOpened
                          ? Constant.homeHeadingPadding
                          : Constant.homeFirstHeadingPadding,
                      hintText: Strings.discoverACulture,
                      prefixIcon: Padding(
                        padding:
                            const EdgeInsets.all(Constant.searchIconPadding),
                        child: SvgPicture.asset(
                          search,
                          height: Constant.searchIconHeight,
                          width: Constant.searchIconWidth,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  homeController.isSearchOpened
                      ? Expanded(
                          flex: Constant.INT_TWO,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: Constant.filterBoxTopPadding,
                              right: Constant.filterBoxLeftPadding,
                            ),
                            child: Container(
                              height: Constant.filterBoxHeight,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: AppTheme.filterBoxshadowColor,
                                      offset: AppTheme.offset1,
                                      blurRadius: Constant.blurRadius1,
                                      spreadRadius: Constant.FIVE,
                                    ),
                                    BoxShadow(
                                      color: AppTheme.tripCardBoxshadowColor2,
                                      offset:
                                          Offset(Constant.zero, Constant.FOUR),
                                      blurRadius: Constant.blurRadius2,
                                      spreadRadius: Constant.zero,
                                    ),
                                    BoxShadow(
                                      color: AppTheme.colorWhite,
                                      offset: AppTheme.offset3,
                                      blurRadius: Constant.blurRadius3,
                                      spreadRadius: Constant.zero,
                                    ),
                                  ],
                                  color: AppTheme.colorWhite,
                                  borderRadius: BorderRadius.circular(
                                      Constant.filterBoxRadius)),
                              padding: const EdgeInsets.only(
                                  top: Constant.filterIconTopPadding,
                                  bottom: Constant.filterIconLeftPadding),
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: Center(
                                  child: SvgPicture.asset(filter,
                                      width: Constant.filterIconWidth,
                                      height: Constant.filterIconHeight),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
              homeController.isSearchOpened
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();

                              homeController.isSearchOpened = false;
                              homeController.isKeyBoardOpen =
                                  !homeController.isKeyBoardOpen;
                              homeController.update();
                            },
                            child: CustomText(
                              title: Strings.closeSearchOption,
                              fontSize: Constant.closeSearchSize,
                              fontWight: FontWeight.bold,
                              color: AppTheme.themeColor,
                            ))
                      ],
                    )
                  : Container(),
              homeController.isSearchOpened
                  ? searchedTileList(images)
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: Constant.homeFirstHeadingPadding,
                              right: Constant.homeFirstHeadingPadding),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              mainTitle(title: Strings.categories),
                              Row(
                                children: [
                                  cardButton(image: spot, title: Strings.spots),
                                  cardButton(
                                      image: spot2, title: Strings.spots),
                                  cardButton(
                                      image: events, title: Strings.events),
                                  cardButton(
                                      image: flight, title: Strings.flights)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            mainTitle(
                                title: Strings.popularTrips,
                                leftPadding: Constant.homeFirstHeadingPadding,
                                rightPadding: Constant.homeFirstHeadingPadding),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  Constant.tripCardListHeight,
                              width: MediaQuery.of(context).size.width,
                              child: ListView(
                                padding: const EdgeInsets.only(
                                    left: Constant.homeFirstHeadingPadding),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  tripCardTile(image: image1),
                                  tripCardTile(image: image2),
                                  tripCardTile(image: image3),
                                  tripCardTile(image: image4),
                                ],
                              ),
                            ),
                            mainTitle(
                                title: Strings.tranding,
                                leftPadding: Constant.homeFirstHeadingPadding,
                                rightPadding: Constant.homeFirstHeadingPadding),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  Constant.tripCardListHeight,
                              width: MediaQuery.of(context).size.width,
                              child: ListView(
                                padding: const EdgeInsets.only(
                                    left: Constant.homeFirstHeadingPadding),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  tripCardTile(image: image4),
                                  tripCardTile(image: image5),
                                  tripCardTile(image: image6),
                                  tripCardTile(image: image4),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: Constant.homeBottomPadding,
                            ),
                          ],
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }

  bottomNavBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(Constant.bottomNavigationBarPadding),
        child: Container(
          decoration: BoxDecoration(
              color: AppTheme.colorWhite,
              boxShadow: [Constant.boxShadow(color: AppTheme.greyColor)],
              borderRadius:
                  BorderRadius.circular(Constant.bottomNavigationBarRadius)),
          padding: const EdgeInsets.only(
              left: Constant.bottomBarLeftPadding,
              right: Constant.bottomBarRightPadding),
          width: width,
          height: height * Constant.bottomBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              navBarItem(
                  title: Strings.home,
                  index: Constant.INT_ONE,
                  icon: home,
                  tappedIcon: tapHome),
              navBarItem(
                  title: Strings.plans,
                  index: Constant.INT_TWO,
                  icon: favorite,
                  tappedIcon: tapFavorite),
              navBarItem(
                  title: Strings.profile,
                  index: Constant.INT_THREE,
                  icon: person,
                  tappedIcon: tapPerson),
              navBarItem(
                  title: Strings.connect,
                  index: Constant.INT_FOUR,
                  icon: chat,
                  tappedIcon: tapChat),
            ],
          ),
        ),
      ),
    );
  }

  navBarItem(
      {required int index,
      required String icon,
      required String tappedIcon,
      required String title}) {
    return InkWell(
      onTap: () {
        homeController.index = index;
        homeController.update();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            homeController.index == index ? tappedIcon : icon,
            height: Constant.bottomBarIconSize,
            width: Constant.bottomBarIconSize,
            color: homeController.index == index
                ? AppTheme.themeColor
                : AppTheme.greyColor,
          ),
          CustomText(
            topPadding: Constant.bottomBarTitlePadding,
            title: title,
            fontSize: Constant.bottomBarTitleSize,
            color: homeController.index == index
                ? AppTheme.themeColor
                : AppTheme.greyColor,
          )
        ],
      ),
    );
  }
}
