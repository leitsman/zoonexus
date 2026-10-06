import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zoonexus/theme/app_theme.dart';

void main() {
  group('AppTheme', () {
    test('exposes constant color tokens', () {
      expect(AppTheme.primaryColor, const Color(0xFF2E7D5B));
      expect(AppTheme.secondaryColor, const Color(0xFF1F3A5F));
      expect(AppTheme.attentionColor, const Color(0xFFC98A1F));
      expect(AppTheme.criticalColor, const Color(0xFFA33B3B));
      expect(AppTheme.surfaceColor, const Color(0xFFF5F7F6));
      expect(AppTheme.fontFamily, 'PlusJakartaSans');
    });

    test('exports AppSeverity correctly', () {
      expect(AppSeverity.normal, isNotNull);
    });

    test('lightTheme uses Material 3 and PlusJakartaSans fontFamily', () {
      final theme = AppTheme.lightTheme;
      expect(theme.useMaterial3, isTrue);
      expect(theme.textTheme.bodyMedium?.fontFamily, 'PlusJakartaSans');
      expect(theme.scaffoldBackgroundColor, const Color(0xFFF5F7F6));
    });

    test('lightTheme has exact ColorScheme values', () {
      final theme = AppTheme.lightTheme;
      final scheme = theme.colorScheme;
      expect(scheme.primary, const Color(0xFF2E7D5B));
      expect(scheme.secondary, const Color(0xFF1F3A5F));
      expect(scheme.surface, const Color(0xFFF5F7F6));
      expect(scheme.error, const Color(0xFFA33B3B));
    });

    test('lightTheme configures CardThemeData with 12px radius, 1 elevation, and white color', () {
      final theme = AppTheme.lightTheme;
      final cardTheme = theme.cardTheme;
      expect(cardTheme.color, Colors.white);
      expect(cardTheme.elevation, 1.0);
      expect(cardTheme.margin, EdgeInsets.zero);
      expect(
        cardTheme.shape,
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      );
    });

    test('lightTheme configures AppBarTheme with secondaryColor background and white foreground', () {
      final theme = AppTheme.lightTheme;
      final appBarTheme = theme.appBarTheme;
      expect(appBarTheme.backgroundColor, const Color(0xFF1F3A5F));
      expect(appBarTheme.foregroundColor, Colors.white);
      expect(appBarTheme.centerTitle, isFalse);
      expect(appBarTheme.elevation, 0);
    });

    test('lightTheme configures NavigationBarThemeData, ChipThemeData, and ListTileThemeData', () {
      final theme = AppTheme.lightTheme;
      final navTheme = theme.navigationBarTheme;
      expect(navTheme.backgroundColor, Colors.white);
      expect(navTheme.elevation, 2.0);

      final chipTheme = theme.chipTheme;
      expect(
        chipTheme.shape,
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      );

      final listTileTheme = theme.listTileTheme;
      expect(
        listTileTheme.contentPadding,
        const EdgeInsets.symmetric(horizontal: 16.0),
      );
    });
  });
}
