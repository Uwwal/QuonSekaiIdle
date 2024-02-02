import 'package:flutter/material.dart';

import '../constants/colors.dart';

final ThemeData material3Theme = ThemeData.from(
  colorScheme: ColorScheme.fromSeed(seedColor: themeSeedColor),
  useMaterial3: true,
);

final ThemeData customTheme = material3Theme.copyWith(
  scaffoldBackgroundColor: darkBlueBackgroundColor,
  appBarTheme: const AppBarTheme(
    color: appBarDarkColor,
    titleTextStyle: TextStyle(
      fontSize: 22.0,
      color: startupPageTextLightPinkColor,
    ),
    iconTheme: IconThemeData(
      color: startupPageTextLightPinkColor,
    ),
  ),
  textTheme: material3Theme.textTheme.copyWith(
    bodyLarge: const TextStyle(
      color: themeInputBodyColor,
    ),
    labelMedium: const TextStyle(
      color: startupPageTextLightPinkColor,
    ),
  ),
  inputDecorationTheme: material3Theme.inputDecorationTheme.copyWith(
    labelStyle: const TextStyle(
      color: themeInputDecorationLaborColor,
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: themeInputDecorationBorderColor,
      ),
    ),
  ),
);
