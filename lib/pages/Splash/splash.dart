import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/pages/Splash/splash_controller.dart';
import 'package:tourease/util/_string.dart';
import 'package:tourease/util/constants.dart';
import 'package:tourease/util/resources.dart';
import 'package:tourease/widgets/custom_text.dart';
import 'package:tourease/widgets/no_appbar.dart';
import '../../util/hexcode.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    splashController.height = MediaQuery.of(context).size.height;
    splashController.width = MediaQuery.of(context).size.width;
    splashController.update();

    return GetBuilder(
        init: splashController,
        builder: (con) {
          return SafeArea(
            child: Scaffold(
              appBar: NoAppBar(),
              body: Container(
                color: HexColor('#f2f0f6'),
                padding: const EdgeInsets.all(Constant.splashAllPadding),
                height: splashController.height,
                width: splashController.width,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: splashController.height! / 3,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Constant.splashIconRadius),
                          image: const DecorationImage(
                              image: AssetImage(appLogo), fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.all(Constant.splashTextPadding),
                        child: CustomText(
                          title: Strings.appName,
                          fontSize: Constant.splashText,
                          fontWight: FontWeight.bold,
                       
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
