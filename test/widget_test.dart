import 'package:flutter_test/flutter_test.dart';

import 'package:cineteca/main.dart';

void main() {
  testWidgets('La app arranca y muestra el título', (tester) async {
    await tester.pumpWidget(const CinetecaApp());
    expect(find.text('Cineteca'), findsOneWidget);
  });
}
