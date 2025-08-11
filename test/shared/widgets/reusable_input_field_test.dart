import 'package:dobby/shared/widgets/inputs/reusable_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ReusableInputField', () {
    testWidgets('renders only TextFormField when heading is null',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                body: ReusableInputField(),
              ),
            ),
          );

          // Should find TextFormField
          expect(find.byType(TextFormField), findsOneWidget);

          // Should not find any Text widget (heading)
          expect(find.byType(Text), findsNothing);
        });

    testWidgets('renders heading and TextFormField when heading is provided',
            (WidgetTester tester) async {
          const headingText = 'My Heading';

          await tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                body: ReusableInputField(heading: headingText),
              ),
            ),
          );

          // Should find heading text
          expect(find.text(headingText), findsOneWidget);

          // Should find TextFormField
          expect(find.byType(TextFormField), findsOneWidget);
        });

    testWidgets('updates controller text when typing',
            (WidgetTester tester) async {
          final controller = TextEditingController();

          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: ReusableInputField(controller: controller),
              ),
            ),
          );

          const inputText = 'Hello World';

          await tester.enterText(find.byType(TextFormField), inputText);
          await tester.pump();

          // Controller should have updated value
          expect(controller.text, equals(inputText));
        });
  });
}
