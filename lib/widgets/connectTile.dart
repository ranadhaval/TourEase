import 'package:flutter/material.dart';
import 'package:tourease/theme/app_theme.dart';
import 'package:tourease/util/_string.dart';
import 'package:tourease/util/constants.dart';
import 'package:tourease/widgets/custom_text.dart';

class ConnectTile extends StatefulWidget {
  String image;
  String title;
  void Function()? onTap;
  bool isGroupTile;
  bool wantToAddMore;
  ConnectTile(
      {super.key,
      this.wantToAddMore = false,
      this.isGroupTile = true,
      required this.image,
      required this.title,
      this.onTap});

  @override
  State<ConnectTile> createState() => _ConnectTileState();
}

class _ConnectTileState extends State<ConnectTile> {
  double? width;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return InkWell(
      highlightColor: AppTheme.colorTransprant,
      splashColor: AppTheme.colorTransprant,
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: Constant.groupTileBottomMargin),
        padding: EdgeInsets.only(
            left: Constant.groupTileLeftPadding,
            right: Constant.groupTileRightPadding,
            top: widget.wantToAddMore
                ? Constant.superLeadsTileTopPadding
                : Constant.groupTileTopPadding,
            bottom: Constant.groupTileBottomPadding),
        width: width,
        decoration: BoxDecoration(
            color: AppTheme.colorWhite,
            borderRadius: BorderRadius.circular(Constant.groupTileRadius),
            boxShadow: [
              Constant.boxShadow(
                  color: AppTheme.greyColor,
                  opacity: Constant.groupTileBoxShadowOpacity)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: Constant.groupTileImageRadius,
                  backgroundImage: AssetImage(widget.image),
                ),
                const SizedBox(
                  width: Constant.SIZE15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: widget.title,
                      fontSize: Constant.groupTileTitleSize,
                      fontfamily: Strings.emptyString,
                      fontWight: FontWeight.w600,
                    ),
                    CustomText(
                      topPadding: Constant.groupTileSubTitleTopPadding,
                      title: 'Aenean sed imperdiet',
                      fontSize: Constant.groupTileSubTitleSize,
                      fontfamily: Strings.emptyString,
                      fontWight: FontWeight.w300,
                      color: AppTheme.connectSubTitleThemeColor,
                    ),
                    widget.isGroupTile
                        ? CustomText(
                            title: '49 participants',
                            topPadding: Constant.groupTileSubTitle2TopPadding,
                            fontSize: Constant.groupTileSubTitleSize,
                            fontfamily: Strings.emptyString,
                            fontWight: FontWeight.w300,
                            color: AppTheme.connectSubTitleThemeColor,
                          )
                        : Container()
                  ],
                )
              ],
            ),
            widget.wantToAddMore 
                ? Expanded(
                    child: Container(
                      height: Constant.groupTileButtonContainerSize,
                      padding: const EdgeInsets.only(
                        left: Constant.groupTileButtonContainerLeftPadding,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: Constant
                                    .groupTileButtonMainContainerTopPadding),
                            child: Container(
                              height:
                                  Constant.groupTileButtonMainContainerHeight,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Constant
                                    .groupTileButtonMainContainerRadius),
                                color: AppTheme.themeColor,
                              ),
                              child: Center(
                                  child: CustomText(
                                title: widget.isGroupTile
                                    ? Strings.join
                                    : Strings.connect_,
                                fontfamily: Strings.emptyString,
                                fontWight: FontWeight.w600,
                                color: AppTheme.colorWhite,
                                fontSize: Constant.groupTileButtonTitleSize,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Icon(
                    Icons.navigate_next,
                    size: 30,
                    color: AppTheme.connectSubTitleThemeColor,
                  )
          ],
        ),
      ),
    );
  }
}
