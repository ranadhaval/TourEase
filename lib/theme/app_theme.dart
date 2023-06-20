import 'package:flutter/material.dart';
import 'package:tourease/util/hexcode.dart';
// import 'package:tourease/util/hexcode.dart';

class AppTheme {
  AppTheme._();
  static const Color primaryColor = Colors.white;
  static const Color colorWhite54 = Colors.white54;

  static Color themeColor = HexColor('#4bb6ff');
  static const Color colorWhite30 = Colors.white30;
  static const Color colorWhite38 = Colors.white38;
  static const Color colorWhite60 = Colors.white60;

  // static const Color colorWhite = Colors.white;

  static const Color colorWhite = Colors.white;
  static const Color colorblack = Colors.black;
  static const Color colorblack12 = Colors.black12;
  static const Color colorblack87 = Colors.black87;

  static const Color colorblue = Colors.blue;

  static const Color colorblack45 = Colors.black45;
  static const Color colorblack38 = Colors.black38;
  static Color tutorialAppbarColor = HexColor(
    '#6BB8FF',
  );

  static Color buttonThemeColor = HexColor('#46B4FF');
  static Color editProfileBodyColor = HexColor('#F5F5F5');

  static const Color colorPrimaryTheme = Color.fromARGB(163, 153, 218, 240);
  static TextTheme textTheme = const TextTheme();
  static const String appFontName = 'Roboto';
  static const Color greyColor = Colors.grey;
  static const FontWeight fontWeight = FontWeight.w300;
  static Color customFocusColor = HexColor('#4bb6ff');
  static Color profilleSubTitleThemeColor = HexColor('#8E89A9');
  static Color connectSubTitleThemeColor = HexColor('#8E89A9');

  static const Color textFieldIconColor = Colors.black38;
  static const Color textFieldHintColor = Colors.black38;
  static const Color colorTransprant = Colors.transparent;
  static Color customButtonBgColor = HexColor('#4bb6ff');
  static const Color filterBoxshadowColor = Color.fromRGBO(205, 214, 235, 0.2);
  static Color connectBodyColor = HexColor('#F5F5F5');

  //tutorial page

  static List<Color> tutorialBgColor = [
    HexColor('#6BB8FF'),
    HexColor('#84D3FF').withOpacity(0.8),
    HexColor('#84D3FF').withOpacity(0.6)
  ];
  static const Color dotColor = Colors.white54;

  //login page
  static Color loginPageColor = HexColor('#f2f0f6');

  //forgot password
  static Color forgotPasswordColor = HexColor('#F9F9F9');
  static Color forgotSubtitleColor = HexColor('#615F6A');

  //Succesfully sent page
  static Color successFullySentColor = HexColor('#F9F9F9');
  static List<Color> circleBgColor = [
    HexColor('#39ACFF'),
    HexColor('#6CCAFF'),
  ];
  static Color successfullSubTitleColor = HexColor('#615F6A');

  // signup page
  static Color signupBodyColor = HexColor('#F9F9F9');

// Home page
  static Color tripCardLocationColor = HexColor('#8E89A9');
  static const Color tripCardBoxshadowColor1 =
      Color.fromRGBO(204, 200, 225, 0.41);
  static const Color tripCardBoxshadowColor2 = Color.fromRGBO(0, 10, 255, 0.12);
  static const Color tripCardBoxshadowColor4 =
      Color.fromRGBO(255, 255, 255, 0.18);

  // detail page
  static Color detailMapBoxColor = HexColor('#E4E2EC');
  static Color detailMapBoxIconColor = HexColor('#8E89A9');

  static const Offset offset1 = Offset(10, 9);
  static const Offset offset2 = Offset(-8, -7);
  static const Offset offset3 = Offset(7, -3);

  static List<Color> homeBgColor = [
    HexColor('#f6f8f9'),
    HexColor('#e2f0fa'),
  ];

  static List<Color> homeBgColor2 = [AppTheme.colorWhite, AppTheme.colorWhite];

  static Color paymentPageColor = HexColor('#F5F5F5');
}
