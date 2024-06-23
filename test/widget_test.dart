import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:praktikum_3/app.dart';

void main() {
  testWidgets('HomePage displays "You did it!"', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ShrineApp());

    // Verify that the login page is displayed
    expect(find.text('Login'), findsOneWidget);

    // Simulate a tap to navigate to HomePage if necessary
    // Assuming there is a button with text 'Login' to go to HomePage
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Verify that HomePage displays the text 'You did it!'
    expect(find.text('You did it!'), findsOneWidget);
  });
}
