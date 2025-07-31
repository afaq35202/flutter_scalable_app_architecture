import 'package:dobby/shared/widgets/loaders/reusable_linear_progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ReusableLinearProgressLoader', () {
    testWidgets('renders LinearProgressIndicator inside SizedBox', (WidgetTester tester) async {
      const width = 200.0;
      const height = 10.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ReusableLinearProgressLoader(
              width: width,
              height: height,
            ),
          ),
        ),
      );

      // Verify LinearProgressIndicator is present
      expect(find.byType(LinearProgressIndicator), findsOneWidget);

      // Find the SizedBox
      final sizedBoxFinder = find.byType(SizedBox);
      expect(sizedBoxFinder, findsOneWidget);

      final sizedBoxWidget = tester.widget<SizedBox>(sizedBoxFinder);
      expect(sizedBoxWidget.width, width);
      expect(sizedBoxWidget.height, height);
    });
  });
}
