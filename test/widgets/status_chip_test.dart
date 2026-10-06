import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zoonexus/theme/app_theme.dart';
import 'package:zoonexus/widgets/status_chip.dart';

void main() {
  Widget buildSubject({
    required AppSeverity severity,
    String? label,
    bool showIcon = true,
  }) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: Scaffold(
        body: Center(
          child: StatusChip(
            severity: severity,
            label: label,
            showIcon: showIcon,
          ),
        ),
      ),
    );
  }

  group('StatusChip', () {
    testWidgets(
      'renders AppSeverity.normal with green theme, icon, and default label',
      (tester) async {
        await tester.pumpWidget(buildSubject(severity: AppSeverity.normal));

        expect(find.text('Normal'), findsOneWidget);
        expect(find.byIcon(Icons.check_circle_outline), findsOneWidget);

        final container = tester.widget<Container>(
          find.byType(Container).first,
        );
        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, const Color(0xFFE8F5E9));

        final text = tester.widget<Text>(find.text('Normal'));
        expect(text.style?.color, const Color(0xFF2E7D5B));
      },
    );

    testWidgets(
      'renders AppSeverity.attention with amber theme, icon, and default label',
      (tester) async {
        await tester.pumpWidget(buildSubject(severity: AppSeverity.attention));

        expect(find.text('Atención'), findsOneWidget);
        expect(find.byIcon(Icons.warning_amber_rounded), findsOneWidget);

        final container = tester.widget<Container>(
          find.byType(Container).first,
        );
        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, const Color(0xFFFFF8E1));

        final text = tester.widget<Text>(find.text('Atención'));
        expect(text.style?.color, const Color(0xFFC98A1F));
      },
    );

    testWidgets(
      'renders AppSeverity.critical with red theme, icon, and default label',
      (tester) async {
        await tester.pumpWidget(buildSubject(severity: AppSeverity.critical));

        expect(find.text('Alerta'), findsOneWidget);
        expect(find.byIcon(Icons.error_outline), findsOneWidget);

        final container = tester.widget<Container>(
          find.byType(Container).first,
        );
        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, const Color(0xFFFFEBEE));

        final text = tester.widget<Text>(find.text('Alerta'));
        expect(text.style?.color, const Color(0xFFA33B3B));
      },
    );

    testWidgets('renders custom label override when provided', (tester) async {
      await tester.pumpWidget(
        buildSubject(
          severity: AppSeverity.attention,
          label: 'Precaución especial',
        ),
      );

      expect(find.text('Precaución especial'), findsOneWidget);
      expect(find.text('Atención'), findsNothing);
    });

    testWidgets('hides icon when showIcon is false', (tester) async {
      await tester.pumpWidget(
        buildSubject(severity: AppSeverity.normal, showIcon: false),
      );

      expect(find.text('Normal'), findsOneWidget);
      expect(find.byIcon(Icons.check_circle_outline), findsNothing);
    });
  });
}
