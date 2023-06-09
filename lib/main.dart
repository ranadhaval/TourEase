import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as se;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:tourease/routes/app_pages.dart';
import 'package:tourease/routes/app_routes.dart';
import 'package:tourease/theme/app_theme.dart';
import 'package:tourease/util/_string.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  se.SystemChrome.setPreferredOrientations(
      [se.DeviceOrientation.portraitDown, se.DeviceOrientation.portraitUp]);
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, dtype) {
      return GetMaterialApp(
        theme: ThemeData(
          primaryColor: AppTheme.primaryColor,
          fontFamily: AppTheme.appFontName,
          textTheme: AppTheme.textTheme,
          appBarTheme: const AppBarTheme(
            systemOverlayStyle:
                se.SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppTheme.colorPrimaryTheme,
            selectionColor: AppTheme.colorPrimaryTheme,
            selectionHandleColor: AppTheme.colorPrimaryTheme,
          ),
        ),
        defaultTransition: Transition.size,
        title: Strings.appName,
        initialRoute: AppRoute.SPLASH,
        getPages: AppPages.list,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
