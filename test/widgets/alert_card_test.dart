import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zoonexus/data/mock_data.dart';
import 'package:zoonexus/theme/app_theme.dart';
import 'package:zoonexus/widgets/alert_card.dart';

void main() {
  Widget buildSubject({required AlertItem alert, VoidCallback? onTap}) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: Scaffold(
        body: AlertCard(alert: alert, onTap: onTap),
      ),
    );
  }

  group('AlertCard', () {
    testWidgets(
      'renders alert title, relative time, icon, and severity indicator bar',
      (tester) async {
        const alert = AlertItem(
          title: 'Temperatura elevada — Vaca #04',
          relativeTime: 'hace 2 h',
          severity: AppSeverity.attention,
          icon: Icons.thermostat,
        );

        await tester.pumpWidget(buildSubject(alert: alert));

        expect(find.text('Temperatura elevada — Vaca #04'), findsOneWidget);
        expect(find.text('hace 2 h'), findsOneWidget);
        expect(find.byIcon(Icons.thermostat), findsOneWidget);

        final iconWidget = tester.widget<Icon>(find.byIcon(Icons.thermostat));
        expect(iconWidget.color, const Color(0xFFC98A1F));
      },
    );

    testWidgets('renders optional subtitle when present', (tester) async {
      const alert = AlertItem(
        title: 'Fiebre confirmada — Vaca #02',
        subtitle: 'Lectura de 40.2 °C detectada por sensor ZX-102',
        relativeTime: 'ayer',
        severity: AppSeverity.critical,
        icon: Icons.local_hospital,
      );

      await tester.pumpWidget(buildSubject(alert: alert));

      expect(find.text('Fiebre confirmada — Vaca #02'), findsOneWidget);
      expect(
        find.text('Lectura de 40.2 °C detectada por sensor ZX-102'),
        findsOneWidget,
      );
      expect(find.text('ayer'), findsOneWidget);
      expect(find.byIcon(Icons.local_hospital), findsOneWidget);
    });

    testWidgets('executes onTap callback when tapped', (tester) async {
      var tapped = false;
      const alert = AlertItem(
        title: 'Alerta interactiva',
        relativeTime: 'ahora',
        severity: AppSeverity.normal,
        icon: Icons.check_circle,
      );

      await tester.pumpWidget(
        buildSubject(alert: alert, onTap: () => tapped = true),
      );

      await tester.tap(find.text('Alerta interactiva'));
      await tester.pump();

      expect(tapped, isTrue);
    });
  });
}
