import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:dobby/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Clicking navigate button should go to MachinesPage',
          (WidgetTester tester) async {
        app.main(); // Launch the app
        await tester.pumpAndSettle();

        // Verify we are on the Home page
        // expect(find.text('info'), findsOneWidget);

        // Tap on the 'Navigate' button
        final navigateButton = find.widgetWithText(ElevatedButton, 'Navigate');
        expect(navigateButton, findsOneWidget);

        await tester.tap(navigateButton);
        await tester.pumpAndSettle();

        // Verify we're on the MachinesPage (using a text or key from MachinesPage)
        expect(find.text('Machines Screen'), findsOneWidget); // Adjust this as needed
      });
}
