import 'package:flutter_test/flutter_test.dart';
import 'package:app6/main.dart';

void main() {
  testWidgets('AquaLog renders app correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const AquaLogApp());
    expect(find.byType(AquaLogApp), findsOneWidget);
  });
}
