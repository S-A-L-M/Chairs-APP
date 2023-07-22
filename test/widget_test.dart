import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:untitled1/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verifica que el contador empiece en 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Encuentra el botón de suma y toca.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verifica que el contador se haya incrementado.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
