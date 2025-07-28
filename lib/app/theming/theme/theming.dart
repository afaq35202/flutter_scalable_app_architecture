// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:dobby/app/theming/theme/text_theme.dart';
import 'package:flutter/material.dart';


abstract final class AppTheme {
  static const _inputDecorationTheme = InputDecorationTheme(
    hintStyle: TextStyle(
      // grey3 works for both light and dark themes
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryTextTheme: GlobalTextTheme.textTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryTextTheme: GlobalTextTheme.textTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );
}
