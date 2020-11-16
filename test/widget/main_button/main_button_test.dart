import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geldstroom_web_flutter/widget/widget.dart';

void main() {
  group('MainButton', () {
    final title = 'Tap Me!';
    var isTapped = false;

    void handleOnTap() {
      isTapped = true;
    }

    testWidgets(
        'when loading is false should render title'
        'when the button tap should trigger given onTap function',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MainButton(
              title: title,
              onTap: handleOnTap,
            ),
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(isTapped, false);

      await tester.tap(find.text(title));
      expect(isTapped, true);
    });

    testWidgets(
        'when loading is true should render loading child'
        ' and not rendering title', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: MainButton(
          title: title,
          loading: true,
          onTap: () {},
        )),
      ));
      expect(find.text(title), findsNothing);
      expect(
          find.byKey(Key('$kMainButtonLoadingBaseKey$title')), findsOneWidget);
    });
  });
}
