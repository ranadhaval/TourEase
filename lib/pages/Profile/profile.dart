import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/pages/Dashboard/home_controller.dart';
import 'package:tourease/theme/app_theme.dart';
import 'package:tourease/util/_string.dart';
import 'package:tourease/util/constants.dart';
import 'package:tourease/util/resources.dart';
import 'package:tourease/widgets/Custom_Textfield.dart';
import 'package:tourease/widgets/Custombutton.dart';
import 'package:tourease/widgets/_appbar.dart';
import 'package:tourease/widgets/custom_text.dart';
import 'package:tourease/widgets/no_appbar.dart';
import 'profile_controller.dart';

class Profile extends StatefulWidget {
  HomeController homeController;
  Profile({super.key, required this.homeController});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  double? height;
  double? width;

  @override
  void initState() {
    homeController = widget.homeController;
    super.initState();
  }

  HomeController homeController = HomeController();

  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetBuilder(
      init: profileController,
      builder: (_) {
        return Scaffold(
          backgroundColor: profileController.index_ == Constant.INT_THREE
              ? AppTheme.editProfileBodyColor
              : AppTheme.colorWhite,
          appBar: NoAppBar(),
          body: Padding(
              padding: EdgeInsets.only(
                  top: Constant.profileBodyTopPadding,
                  right: profileController.index_ == Constant.INT_THREE
                      ? Constant.editProfileBodyRightPadding
                      : Constant.profileBodyLeftRightBottomPadding,
                  left: profileController.index_ == Constant.INT_THREE
                      ? Constant.editProfileBodyLeftPadding
                      : Constant.profileBodyLeftRightBottomPadding,
                  bottom: Constant.profileBodyLeftRightBottomPadding),
              child: SingleChildScrollView(
                child: Builder(builder: (context) {
                  switch (profileController.index_) {
                    case 1:
                      return _accountBody();
                    case 2:
                      return _profileBody();
                    case 3:
                      return _editProfileBody();
                    default:
                      return _accountBody();
                  }
                }),
              )),
        );
      },
    );
  }

  _accountBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(
            title: Strings.account,
            space: Constant.SIZE15,
            onTap: () {
              homeController.index = Constant.INT_ONE;
              homeController.update();
            }),
        Padding(
          padding: const EdgeInsets.only(top: Constant.profileTileTopPadding),
          child: Row(
            children: [
              const CircleAvatar(
                radius: Constant.accountCirccleImageRadius1,
                child: Image(
                    image: AssetImage(
                  imageUser,
                )),
              ),
              const SizedBox(
                width: Constant.SIZE20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: Strings.dhavalRana,
                    fontfamily: Strings.emptyString,
                    fontWight: FontWeight.w400,
                    fontSize: Constant.profileNameTitleSize,
                  ),
                  InkWell(
                    onTap: () {
                      profileController.index_ = Constant.INT_TWO;
                      profileController.update();
                    },
                    child: CustomText(
                      title: Strings.viewMyProfile,
                      height: Constant.viewMyProfileTitleHeight,
                      fontfamily: Strings.emptyString,
                      color: AppTheme.themeColor,
                      fontSize: Constant.profileNameSubTitleSize,
                      fontWight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title: Strings.settings,
              topPadding: Constant.settingTitleTopPadding,
              bottomPadding: Constant.settingTileTitleBottomPadding,
              fontSize: Constant.settingTitleSize,
              fontWight: FontWeight.w500,
              fontfamily: Strings.emptyString,
            ),
            settingTile(title: Strings.personalInformation),
            settingTile(title: Strings.myBookings),
            settingTile(title: Strings.myMessages),
            settingTile(title: Strings.payment),
            settingTile(title: Strings.groups),
            settingTile(title: Strings.notifications),
            settingTile(title: Strings.refer),
            settingTile(title: Strings.helpCenter),
          ],
        )
      ],
    );
  }

  _profileBody() {
    return Column(
      children: [
        CustomAppBar(
            title: Strings.profile,
            space: Constant.SIZE15,
            onTap: () {
              profileController.index_ =
                  profileController.index_ - Constant.INT_ONE;
              profileController.update();
            }),
        Padding(
          padding: const EdgeInsets.only(top: Constant.profileTileTopPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(
                    topPadding: Constant.profilePageTitleNameTopPadding,
                    title: Strings.hiDhaval,
                    fontfamily: Strings.emptyString,
                    fontWight: FontWeight.bold,
                    fontSize: Constant.profilePageTitleNameSize,
                  ),
                  CustomText(
                    height: Constant.profilePageJoinedTitleHeight,
                    title: Strings.joinedMar_2021,
                    color: AppTheme.profilleSubTitleThemeColor,
                    fontSize: Constant.profilePageJoinedTitleSize,
                    fontfamily: Strings.emptyString,
                    fontWight: FontWeight.w400,
                  ),
                ],
              ),
              const SizedBox(
                width: Constant.SIZE15,
              ),
              const CircleAvatar(
                radius: Constant.profilePageimageCircleRadius,
                child: Image(
                    image: AssetImage(
                  imageUser,
                )),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: Constant.SIZE50,
        ),
        profileTile(title: Strings.email, subTitle: Strings.rd8452387),
        profileTile(title: Strings.phoneNumber, subTitle: Strings.s9316909784),
        profileTile(title: Strings.gender, subTitle: Strings.male),
        profileTile(
            title: Strings.dateOfBirth, subTitle: Strings.date_24_02_1997),
        InkWell(
          splashColor: AppTheme.colorTransprant,
          highlightColor: AppTheme.colorTransprant,
          onTap: () {
            profileController.index_ = Constant.INT_THREE;
            profileController.update();
          },
          child: CustomButton(
              topPadding: Constant.editButtonTopPadding,
              backgroundColor: AppTheme.themeColor,
              borderColor: AppTheme.themeColor,
              buttonTitle: Strings.edit,
              leftPadding: Constant.zero,
              rightPadding: Constant.zero,
              textColor: AppTheme.colorWhite),
        )
      ],
    );
  }

  _editProfileBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(
              title: Strings.editProfile,
              space: Constant.SIZE15,
              onTap: () {
                profileController.index_ =
                    profileController.index_ - Constant.INT_ONE;
                profileController.update();
              }),
          Padding(
            padding: const EdgeInsets.only(
                top: Constant.editProfileCircleTopPadding,
                bottom: Constant.editProfileCircleBottomPadding),
            child: SizedBox(
              height: height! * Constant.editProfileBodyCircleHeight,
              width: width! / Constant.editProfileBodyCircleWidth,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: height! * Constant.editProfileBodyCircleRadius,
                    child: const Image(
                        image: AssetImage(
                      imageUser,
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: Constant.editCircleBottomPaadding,
                      right: width! * Constant.editCircleRightPadding,
                    ),
                    child: const Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: Constant.editCircleRadius,
                        backgroundColor: AppTheme.colorWhite,
                        child: Icon(
                          Icons.edit_outlined,
                          size: Constant.editIconSize,
                          color: AppTheme.colorblack45,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          customTextFeild(
            hintText: Strings.dhavalRana,
          ),
          customTextFeild(
            hintText: Strings.rd8452387,
          ),
          customTextFeild(
            hintText: Strings.s9316909784,
          ),
          Row(
            children: [
              Expanded(
                flex: Constant.INT_FOUR,
                child: customTextFeild(
                  rightPadding: Constant.spacePaddingBtwMaleAndBod,
                  hintText: Strings.male,
                ),
              ),
              Expanded(
                flex: Constant.INT_SIX,
                child: customTextFeild(
                  hintText: Strings.date_24_02_1997,
                ),
              ),
            ],
          ),
          CustomButton(
              onTap: () {
                profileController.index_ = Constant.INT_ONE;
                profileController.update();
              },
              topPadding: Constant.saveButtonPadding,
              backgroundColor: AppTheme.themeColor,
              borderColor: AppTheme.themeColor,
              buttonTitle: Strings.save,
              leftPadding: Constant.zero,
              rightPadding: Constant.zero,
              textColor: AppTheme.colorWhite),
          SizedBox(
            height: Constant.SIZE60,
          )
        ],
      ),
    );
  }

  profileTile({required String subTitle, required String title}) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                      topPadding: Constant.profileTileTitleTopPadding,
                      title: title,
                      bottomPadding: Constant.profileTileTitleBottomPadding,
                      fontfamily: Strings.emptyString,
                      fontSize: Constant.profileTileTitleSize,
                      fontWight: FontWeight.w400,
                      color: AppTheme.profilleSubTitleThemeColor,
                    )
                  ],
                ),
                Row(
                  children: [
                    CustomText(
                      fontfamily: Strings.emptyString,
                      fontSize: Constant.settingTileSize,
                      title: subTitle,
                      bottomPadding: Constant.profileSubTileTitleSize,
                      fontWight: FontWeight.w400,
                      color: AppTheme.colorblack87,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
        Container(
          height: Constant.settingTileDividerHeight,
          color: AppTheme.greyColor
              .withOpacity(Constant.settingTileDividerColorOpacity),
        ),
      ],
    );
  }

  settingTile({required String title, bool isFirst = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isFirst
            ? Container()
            : Container(
                height: Constant.settingTileDividerHeight,
                color: AppTheme.greyColor
                    .withOpacity(Constant.settingTileDividerColorOpacity),
              ),
        CustomText(
          topPadding: Constant.settingTileTitleTopPadding,
          title: title,
          color: AppTheme.colorblack87,
          fontfamily: Strings.emptyString,
          fontWight: FontWeight.w400,
          fontSize: Constant.settingTileSize,
          bottomPadding: Constant.settingTileTitleBottomPadding,
        ),
      ],
    );
  }

  customTextFeild(
      {TextEditingController? controller,
      required String hintText,
      double leftPadding = Constant.zero,
      double rightPadding = Constant.zero}) {
    return CustomTextFeild(
      controller: controller,
      leftPadding: leftPadding,
      rightPadding: rightPadding,
      hintText: hintText,
      contentLeftPadding: Constant.editTextFeildContentLeftPadding,
      contentRightPadding: Constant.editTextFeildContentRightPadding,
    );
  }
}
