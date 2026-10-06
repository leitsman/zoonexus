import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zoonexus/theme/app_theme.dart';
import 'package:zoonexus/widgets/app_card.dart';

void main() {
  Widget buildSubject({
    required Widget child,
    EdgeInsetsGeometry padding = const EdgeInsets.all(16.0),
    EdgeInsetsGeometry? margin,
    VoidCallback? onTap,
    Color? color,
    double borderRadius = 12.0,
  }) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: Scaffold(
        body: AppCard(
          padding: padding,
          margin: margin,
          onTap: onTap,
          color: color,
          borderRadius: borderRadius,
          child: child,
        ),
      ),
    );
  }

  group('AppCard', () {
    testWidgets(
      'renders child with default 16px padding and 12px border radius',
      (tester) async {
        await tester.pumpWidget(
          buildSubject(child: const Text('Card Content')),
        );

        expect(find.text('Card Content'), findsOneWidget);

        final paddingFinder = find.ancestor(
          of: find.text('Card Content'),
          matching: find.byType(Padding),
        );
        expect(paddingFinder, findsWidgets);

        final paddingWidget = tester.widget<Padding>(paddingFinder.first);
        expect(paddingWidget.padding, const EdgeInsets.all(16.0));

        final cardWidget = tester.widget<Card>(find.byType(Card));
        final shape = cardWidget.shape as RoundedRectangleBorder;
        expect(shape.borderRadius, BorderRadius.circular(12.0));
      },
    );

    testWidgets('supports custom padding override', (tester) async {
      await tester.pumpWidget(
        buildSubject(
          padding: const EdgeInsets.all(8.0),
          child: const Text('Custom Padding Content'),
        ),
      );

      expect(find.text('Custom Padding Content'), findsOneWidget);

      final paddingFinder = find.ancestor(
        of: find.text('Custom Padding Content'),
        matching: find.byType(Padding),
      );
      final paddingWidget = tester.widget<Padding>(paddingFinder.first);
      expect(paddingWidget.padding, const EdgeInsets.all(8.0));
    });

    testWidgets('triggers onTap callback when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        buildSubject(
          onTap: () => tapped = true,
          child: const Text('Tappable Card'),
        ),
      );

      await tester.tap(find.text('Tappable Card'));
      await tester.pump();

      expect(tapped, isTrue);
      expect(find.byType(InkWell), findsOneWidget);
    });

    testWidgets('does not wrap with InkWell when onTap is null', (
      tester,
    ) async {
      await tester.pumpWidget(buildSubject(child: const Text('Static Card')));

      expect(find.byType(InkWell), findsNothing);
    });
  });
}
