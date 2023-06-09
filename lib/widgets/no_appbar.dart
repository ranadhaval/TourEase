import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoAppBar extends StatelessWidget implements PreferredSizeWidget {
  Color colors;

  NoAppBar({Key? key, this.colors = Colors.transparent}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colors,
      elevation: 0.0,
      toolbarHeight: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: colors,
        statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );
  }
}
