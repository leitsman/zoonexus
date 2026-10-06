import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zoonexus/theme/app_severity.dart';

void main() {
  group('AppSeverity', () {
    test('contains exact enum values: normal, attention, critical', () {
      expect(AppSeverity.values, [
        AppSeverity.normal,
        AppSeverity.attention,
        AppSeverity.critical,
      ]);
    });

    test(
      'normal severity maps to expected color, background, icon, and label',
      () {
        const severity = AppSeverity.normal;
        expect(severity.color, const Color(0xFF2E7D5B));
        expect(severity.backgroundColor, const Color(0xFFE8F5E9));
        expect(severity.icon, Icons.check_circle_outline);
        expect(severity.label, 'Normal');
      },
    );

    test(
      'attention severity maps to expected color, background, icon, and label',
      () {
        const severity = AppSeverity.attention;
        expect(severity.color, const Color(0xFFC98A1F));
        expect(severity.backgroundColor, const Color(0xFFFFF8E1));
        expect(severity.icon, Icons.warning_amber_rounded);
        expect(severity.label, 'Atención');
      },
    );

    test(
      'critical severity maps to expected color, background, icon, and label',
      () {
        const severity = AppSeverity.critical;
        expect(severity.color, const Color(0xFFA33B3B));
        expect(severity.backgroundColor, const Color(0xFFFFEBEE));
        expect(severity.icon, Icons.error_outline);
        expect(severity.label, 'Alerta');
      },
    );
  });
}
