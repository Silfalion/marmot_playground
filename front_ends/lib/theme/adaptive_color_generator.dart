import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

Color adaptiveColorGenerator(
  BuildContext context,
  Color elementLightColor,
  Color elementDarkColor,
) {
  return AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
      ? elementLightColor
      : elementDarkColor;
}
