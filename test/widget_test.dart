import 'package:flutter_test/flutter_test.dart';
import 'package:digital_defenders/main.dart';

void main() {
  testWidgets('App loads and shows HomeScreen title', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(const MyApp());

    // ✅ Verify that the HomeScreen loads and "Digital Defenders" text is visible
    expect(find.text('Digital Defenders'), findsOneWidget);
  });
}
