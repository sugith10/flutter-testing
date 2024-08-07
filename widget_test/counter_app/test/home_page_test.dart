import 'package:counter_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'given counter is 0 when increment button is clicked then cou nter should be 1',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: MyHomePage()),
      );
      final ctr = find.text('0');

      expect(ctr, findsOneWidget);

      final ctr2 = find.text("1");

      expect(ctr2, findsNothing);

      final incrementButton = find.byKey(const Key("increment_counter"));

      await tester.tap(incrementButton);

      await tester.pump();

      final ctr3 = find.text('1');

      expect(ctr3, findsOneWidget);
    },
  );
}
