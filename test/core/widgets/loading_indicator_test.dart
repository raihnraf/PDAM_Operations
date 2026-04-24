import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pdam_fields/core/widgets/loading_indicator.dart';

void main() {
  group('LoadingIndicator', () {
    testWidgets('renders CircularProgressIndicator', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoadingIndicator(),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('centers the indicator', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LoadingIndicator(),
          ),
        ),
      );

      final center = tester.widget<Center>(find.byType(Center));
      expect(center.child, isA<Column>());
    });

    testWidgets('renders message when provided', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoadingIndicator(
            message: 'Loading data...',
          ),
        ),
      );

      expect(find.text('Loading data...'), findsOneWidget);
    });

    testWidgets('does not render message when not provided', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoadingIndicator(),
        ),
      );

      final column = tester.widget<Column>(find.byType(Column));
      expect(column.children.length, 1);
      expect(column.children.first, isA<CircularProgressIndicator>());
    });

    testWidgets('applies correct spacing between indicator and message',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoadingIndicator(
            message: 'Please wait',
          ),
        ),
      );

      final column = tester.widget<Column>(find.byType(Column));
      expect(column.children.length, 3);
      expect(column.children[0], isA<CircularProgressIndicator>());
      expect(column.children[1], isA<SizedBox>());
      expect(column.children[2], isA<Text>());

      final sizedBox = column.children[1] as SizedBox;
      expect(sizedBox.height, 16);
    });

    testWidgets('uses mainAxisSize.min for column', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoadingIndicator(
            message: 'Loading',
          ),
        ),
      );

      final column = tester.widget<Column>(find.byType(Column));
      expect(column.mainAxisSize, MainAxisSize.min);
    });

    testWidgets('applies correct text style to message', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            textTheme: const TextTheme(
              bodyMedium: TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ),
          home: const Scaffold(
            body: LoadingIndicator(
              message: 'Styled message',
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Styled message'));
      expect(text.style, isNotNull);
    });
  });
}
