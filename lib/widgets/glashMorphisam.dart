import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tourease/theme/app_theme.dart';

class GlassmorPhism extends StatelessWidget {
  final double blure;
  final double opacity;
  final Widget child;
  final double radius;

  const GlassmorPhism(
      {Key? key,
      this.radius = 20,
      required this.blure,
      required this.child,
      required this.opacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blure, sigmaY: blure),
        child: Container(
          decoration: BoxDecoration(
              color: AppTheme.colorWhite.withOpacity(opacity),
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              border: Border.all(
                  width: 1.5, color: AppTheme.colorWhite.withOpacity(0.3))),
          child: child,
        ),
      ),
    );
  }
}
