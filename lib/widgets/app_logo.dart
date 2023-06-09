import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tourease/theme/app_theme.dart';
import 'package:tourease/util/_string.dart';
import 'package:tourease/util/resources.dart';
import 'package:tourease/widgets/custom_text.dart';

class AppLogo extends StatefulWidget {
  double logoHeight;
  double logoWidth;
  AppLogo({super.key, this.logoHeight = 6.5, this.logoWidth = 3});

  @override
  State<AppLogo> createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> {
  double? height;
  double? width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Container(
            height: height! / widget.logoHeight,
            width: width! / widget.logoWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                    image: AssetImage(appLogo), fit: BoxFit.cover)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomText(
            title: Strings.appName,
            height: 1.5,
            fontWight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
