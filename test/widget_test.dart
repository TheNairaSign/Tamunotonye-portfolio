import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/main.dart';

void main() {
  testWidgets('Portfolio smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const Portfolio());
    expect(find.text('Alex Rivers'), findsAtLeast(1));
  });
}
