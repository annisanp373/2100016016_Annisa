// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:praktikum_4/main.dart';

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