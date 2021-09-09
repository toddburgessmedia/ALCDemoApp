
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mars_flutter/main.dart';

void main() {
  testWidgets('Test TabView exists with proper parameters', (WidgetTester tester) async {
    await tester.pumpWidget(ALCTestApp());

    // Verify that the tabs exist with the proper tab titles
    expect(find.text('Mars'), findsOneWidget);
    expect(find.text('Planets'), findsOneWidget);
    expect(find.text('Web'), findsOneWidget);

  });
}
