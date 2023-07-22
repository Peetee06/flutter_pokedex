import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/fade_page_route.dart';

void main() {
  testWidgets('FadeRoute should display new page', (WidgetTester tester) async {
    // Build the FadeRoute with a new page.
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                child: const Text('Go'),
                onPressed: () {
                  Navigator.push(
                    context,
                    FadeRoute(page: Text('New Page')),
                  );
                },
              );
            },
          ),
        ),
      ),
    );

    // Tap the button to navigate.
    await tester.tap(find.text('Go'));
    await tester.pumpAndSettle();

    // Verify that the new page is displayed.
    expect(find.text('New Page'), findsOneWidget);
  });

  testWidgets('FadeRoute should apply fade transition', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                child: const Text('Go'),
                onPressed: () {
                  Navigator.push(
                    context,
                    FadeRoute(page: Container()),
                  );
                },
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Go'));

    // Wait for the transition to complete.
    await tester.pumpAndSettle();

    // Expect the FadeTransition to be present.
    expect(find.byType(FadeTransition), findsOneWidget);
  });
}
