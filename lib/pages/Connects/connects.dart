import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tourease/pages/Connects/connects_controller.dart';
import 'package:tourease/pages/Connects/groupJoin.dart';
import 'package:tourease/theme/app_theme.dart';
import 'package:tourease/util/_string.dart';
import 'package:tourease/util/constants.dart';
import 'package:tourease/util/resources.dart';
import 'package:tourease/widgets/_appbar.dart';
import 'package:tourease/widgets/connectTile.dart';
import 'package:tourease/widgets/custom_text.dart';
import 'package:tourease/widgets/no_appbar.dart';
import 'superLeadConnect.dart';

class Connect extends StatefulWidget {
  const Connect({super.key});

  @override
  State<Connect> createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  double? height;
  double? width;

  final connectController = Get.put(ConnectController());
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetBuilder(
        init: connectController,
        builder: (context) {
          return Scaffold(
            backgroundColor: AppTheme.connectBodyColor,
            body: Padding(
              padding: const EdgeInsets.only(
                  left: Constant.connectBodyLeftPadding,
                  right: Constant.connectBodyRightPadding,
                  top: Constant.connectBodyTopPadding),
              child: Builder(builder: (context) {
                switch (connectController.index) {
                  case Constant.INT_ONE:
                    return __body();
                  case Constant.INT_TWO:
                    return _groupBody();
                  case Constant.INT_THREE:
                    return GroupJoin(connectController: connectController);
                  case Constant.INT_FOUR:
                    return _superLeadsBody();
                  case Constant.INT_FIVE:
                    return SuperLeadConnect(
                        connectController: connectController);
                  default:
                    return __body();
                }
              }),
            ),
          );
        });
  }

  __body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          optionBox(
              icon: superLeads,
              title: Strings.superLeads,
              onTap: () {
                connectController.index = Constant.INT_FOUR;
                connectController.update();
              }),
          optionBox(
              icon: group,
              title: Strings.group,
              onTap: () {
                connectController.index = Constant.INT_TWO;
                connectController.update();
              })
        ],
      ),
    );
  }

  _groupBody() {
    return Scaffold(
      backgroundColor: AppTheme.connectBodyColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: Constant.floatButtonBottomPadding,
        ),
        child: SizedBox(
          height: Constant.floatButtonBottomHeight,
          width: Constant.floatButtonBottomWidth,
          child: FloatingActionButton(
            onPressed: () {
              connectController.index = Constant.INT_THREE;
              connectController.update();
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
      appBar: NoAppBar(),
      body: Column(
        children: [
          CustomAppBar(
              title: Strings.groups,
              space: Constant.SIZE15,
              onTap: () {
                connectController.index = Constant.INT_ONE;
                connectController.update();
              }),
          const SizedBox(
            height: Constant.SIZE15,
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(
                    bottom: Constant.connectListBottomPadding,
                    top: Constant.connectListTopPadding),
                itemCount: connectController.groupImages.length,
                itemBuilder: (context, index) {
                  return ConnectTile(
                      title: connectController.groupTitles[
                          index % connectController.groupTitles.length],
                      image: connectController.groupImages[
                          index % connectController.groupImages.length]);
                }),
          )
        ],
      ),
    );
  }

  _superLeadsBody() {
    return Scaffold(
      backgroundColor: AppTheme.connectBodyColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: Constant.floatButtonBottomPadding,
        ),
        child: SizedBox(
          height: Constant.floatButtonBottomHeight,
          width: Constant.floatButtonBottomWidth,
          child: FloatingActionButton(
            onPressed: () {
              connectController.index = Constant.INT_FIVE;
              connectController.update();
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
      appBar: NoAppBar(),
      body: Column(
        children: [
          CustomAppBar(
              title: Strings.superLeads,
              space: Constant.SIZE15,
              onTap: () {
                connectController.index = Constant.INT_ONE;
                connectController.update();
              }),
          const SizedBox(
            height: Constant.SIZE15,
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(
                    bottom: Constant.connectListBottomPadding,
                    top: Constant.connectListTopPadding),
                itemCount: connectController.leadImages.length + 10,
                itemBuilder: (context, index) {
                  return ConnectTile(
                      isGroupTile: false,
                      title: connectController.leadNames[
                          index % connectController.leadNames.length],
                      image: connectController.leadImages[
                          index % connectController.leadImages.length]);
                }),
          )
        ],
      ),
    );
  }

  optionBox(
      {required String icon, required String title, void Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(top: Constant.connectOptionBoxTopPadding),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height! * Constant.connectOptionBoxHeight,
          width: width! * Constant.connectOptionBoxWidth,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(Constant.connectOptionBoxRadius),
              color: AppTheme.colorWhite,
              boxShadow: [Constant.boxShadow(color: AppTheme.greyColor)]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: Constant.connectOptionBoxIconRightPadding),
                child: SvgPicture.asset(
                  icon,
                  color: AppTheme.themeColor,
                  height: Constant.connectOptionBoxIconSize,
                  width: Constant.connectOptionBoxIconSize,
                ),
              ),
              CustomText(
                title: title,
                fontfamily: Strings.emptyString,
                color: AppTheme.themeColor,
                fontWight: FontWeight.w400,
                fontSize: Constant.connectOptionBoxTitleSize,
              )
            ],
          ),
        ),
      ),
    );
  }
}
