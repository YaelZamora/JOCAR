import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jocar_web/main.dart';

void main() {
  testWidgets('HomeScreen load smoke test', (WidgetTester tester) async {
    // Set viewport size for desktop layout simulation in widget testing environment
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the brand name JOCAR is found on screen.
    expect(find.textContaining('JOCAR'), findsWidgets);

    // Reset view size after test completes
    addTearDown(tester.view.resetPhysicalSize);
  });
}
