import 'package:flutter/material.dart';

export 'app_severity.dart';

abstract final class AppTheme {
  static const Color primaryColor = Color(0xFF2E7D5B);
  static const Color secondaryColor = Color(0xFF1F3A5F);
  static const Color attentionColor = Color(0xFFC98A1F);
  static const Color criticalColor = Color(0xFFA33B3B);
  static const Color surfaceColor = Color(0xFFF5F7F6);
  static const String fontFamily = 'PlusJakartaSans';

  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
      surface: surfaceColor,
      error: criticalColor,
    );

    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: surfaceColor,
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: EdgeInsets.zero,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: primaryColor.withValues(alpha: 0.15),
        elevation: 2.0,
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      ),
    );
  }
}
