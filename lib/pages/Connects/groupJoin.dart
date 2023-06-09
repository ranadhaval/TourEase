// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/pages/Connects/connects_controller.dart';
import 'package:tourease/theme/app_theme.dart';
import 'package:tourease/util/_string.dart';
import 'package:tourease/util/constants.dart';
import 'package:tourease/widgets/_appbar.dart';
import 'package:tourease/widgets/connectTile.dart';
import 'package:tourease/widgets/no_appbar.dart';

class GroupJoin extends StatefulWidget {
  ConnectController connectController;
  GroupJoin({super.key, required this.connectController});

  @override
  State<GroupJoin> createState() => _GroupJoinState();
}

class _GroupJoinState extends State<GroupJoin> {
  @override
  void initState() {
    connectController = widget.connectController;
    super.initState();
  }

  double? width;
  double? height;
  ConnectController connectController = ConnectController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return GetBuilder(
      init: connectController,
      builder: (context) {
        return Scaffold(
          backgroundColor: AppTheme.colorTransprant,
          appBar: NoAppBar(),
          body: Column(
            children: [
              CustomAppBar(
                  title: Strings.groups,
                  space: Constant.SIZE15,
                  onTap: () {
                    connectController.index =
                        connectController.index - Constant.INT_ONE;
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
                    itemCount: connectController.addGroupImage.length,
                    itemBuilder: (context, index) {
                      return ConnectTile(
                          isGroupTile: true,
                          wantToAddMore: true,
                          title: connectController.groupTitles[
                              index % connectController.groupTitles.length],
                          image: connectController.addGroupImage[
                              index % connectController.addGroupImage.length]);
                    }),
              )
            ],
          ),
        );
      },
    );
  }
}
