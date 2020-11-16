import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'package:geldstroom_web_flutter/page/onboarding/onboarding_page.dart';
import 'package:geldstroom_web_flutter/page/page.dart';

import '../../test_helper.dart';

void main() {
  group('OnboardingPage', () {
    test('Onboarding class', () {
      final onboarding = Onboarding(
        title: 'Lorem',
        body: 'Ipsum',
        image: 'someimg',
      );
      expect(onboarding.title, 'Lorem');
      expect(onboarding.body, 'Ipsum');
      expect(onboarding.image, 'someimg');
    });

    testWidgets('should render a onboarding content', (tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpWidget(
          AppWrapper(OnboardingPage()),
        ),
      );

      expect(find.text(kSkipButtonText), findsOneWidget);
      expect(find.text(kNextButtonText), findsOneWidget);

      expect(find.text(onboardingContent[0].title), findsOneWidget);
      expect(find.text(onboardingContent[0].body), findsOneWidget);

      await tester.tap(find.text(kNextButtonText));
      await tester.pumpAndSettle();

      expect(find.text(onboardingContent[1].title), findsOneWidget);
      expect(find.text(onboardingContent[1].body), findsOneWidget);

      await tester.tap(find.text(kNextButtonText));
      await tester.pumpAndSettle();

      expect(find.text(onboardingContent[2].title), findsOneWidget);
      expect(find.text(onboardingContent[2].body), findsOneWidget);

      await tester.tap(find.text(kNextButtonText));
      await tester.pumpAndSettle();

      expect(find.text(onboardingContent[3].title), findsOneWidget);
      expect(find.text(onboardingContent[3].body), findsOneWidget);

      expect(find.text(kDoneButtonText), findsOneWidget);
    });

    testWidgets(
        'should jump to last onboarding content when skip button pressed',
        (tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpWidget(
          AppWrapper(OnboardingPage()),
        ),
      );

      expect(find.text(kSkipButtonText), findsOneWidget);
      expect(find.text(kNextButtonText), findsOneWidget);

      expect(find.text(onboardingContent[0].title), findsOneWidget);
      expect(find.text(onboardingContent[0].body), findsOneWidget);

      await tester.tap(find.text(kSkipButtonText));
      await tester.pumpAndSettle();

      expect(find.text(onboardingContent[3].title), findsOneWidget);
      expect(find.text(onboardingContent[3].body), findsOneWidget);

      expect(find.text(kDoneButtonText), findsOneWidget);
    });

    testWidgets('should render LoginPage when done button pressed',
        (tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpWidget(
          AppWrapper(OnboardingPage()),
        ),
      );

      await tester.tap(find.text(kSkipButtonText));
      await tester.pumpAndSettle();
      await tester.tap(find.text(kDoneButtonText));
      await tester.pumpAndSettle();
      expect(find.byKey(Key(LoginPage.routeName)), findsOneWidget);
    });
  });
}
