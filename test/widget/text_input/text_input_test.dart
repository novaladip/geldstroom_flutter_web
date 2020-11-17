import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geldstroom_web_flutter/widget/text_input/text_input.dart';

import '../../test_helper.dart';

void main() {
  TextEditingController controller;

  setUp(() {
    controller = TextEditingController();
  });

  tearDown(() {
    controller.dispose();
  });

  testWidgets('TextInput', (tester) async {
    final textInputkey = Key('textInput');
    final label = 'Email';

    await tester.pumpWidget(
      AppWrapper(
        Scaffold(
          body: TextInput(
            key: textInputkey,
            labelText: label,
            controller: controller,
          ),
        ),
      ),
    );

    expect(find.text(label), findsOneWidget);

    await tester.enterText(find.byKey(textInputkey), 'john@email.com');

    expect(controller.text, 'john@email.com');
    expect(find.text('john@email.com'), findsOneWidget);
  });
}
