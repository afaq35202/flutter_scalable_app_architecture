import 'package:dobby/shared/widgets/clickables/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ReusableButton', () {
    testWidgets('renders with text and triggers onPressed', (WidgetTester tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ReusableButton(
              text: 'Tap Me',
              onPressed: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      // Verify text is shown
      expect(find.text('Tap Me'), findsOneWidget);

      // Tap the button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump(); // process the tap

      // Verify callback
      expect(pressed, isTrue);
    });

    testWidgets('renders with custom child', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ReusableButton(
              child: Icon(Icons.add),
              onPressed: () {},
            ),
          ),
        ),
      );

      // Verify Icon is present
      expect(find.byIcon(Icons.add), findsOneWidget);
      // Text should not appear
      expect(find.byType(Text), findsNothing);
    });
  });
}
