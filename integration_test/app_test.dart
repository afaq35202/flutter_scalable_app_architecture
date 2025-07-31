import 'package:dobby/features/home/presentation/home_page.dart';
import 'package:dobby/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('navigates to home after splash completes', (WidgetTester tester) async {
    final container = ProviderContainer(
      overrides: [
        // appInitializerProvider.overrideWith((ref) => MockAppInitializerViewModel(AsyncData(null))),
      ],
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MainApp(),
      ),
    );

    // Let navigation and build finish
    await tester.pump(const Duration(seconds: 5));

    // ✅ Verify HomePage loaded
    expect(find.byType(HomePage), findsOneWidget);
    expect(find.text("info"), findsOneWidget);
    expect(find.text("Navigate"), findsOneWidget);
  });
}
