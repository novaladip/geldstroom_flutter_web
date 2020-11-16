import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../constant/app_styles.dart';
import '../../constant/assets.dart';
import '../../routes.dart';
import '../../util/util.dart';
import '../../widget/base_container/base_container.dart';
import '../page.dart';

class Onboarding {
  const Onboarding({
    this.title,
    this.body,
    this.image,
  });

  final String title;
  final String body;
  final String image;
}

const onboardingContent = <Onboarding>[
  Onboarding(
    title: 'Welcome to Geldstroom',
    body: 'Start managing your money with us!',
    image: Assets.welcoming,
  ),
  Onboarding(
    title: 'Data Visualization',
    body: 'To help you make better decision',
    image: Assets.visualData,
  ),
  Onboarding(
    title: 'Cloud Base',
    body: 'Sync on any devices',
    image: Assets.server,
  ),
  Onboarding(
    title: 'Forever Free',
    body: 'No ads & limited features',
    image: Assets.welcoming,
  ),
];

const kNextButtonText = 'Next';
const kSkipButtonText = 'Skip';
const kDoneButtonText = 'Let\'s Go!';

class OnboardingPage extends StatelessWidget {
  static const routeName = '/onboarding';

  Widget actionButton(BuildContext context, String title) => Text(title)
      .textColor(AppStyles.primaryColor)
      .fontSize(context.sizeBuilder(base: 16, xs: 14));

  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration(
      titleTextStyle:
          TextStyle(fontSize: context.sizeBuilder(base: 18, xs: 16)),
      bodyTextStyle: TextStyle(fontSize: context.sizeBuilder(base: 16, xs: 14)),
    );

    return Scaffold(
      body: BaseContainer(
        child: IntroductionScreen(
          curve: Curves.easeInOut,
          showNextButton: true,
          showSkipButton: true,
          skip: actionButton(context, kSkipButtonText),
          done: actionButton(context, kDoneButtonText),
          next: actionButton(context, kNextButtonText),
          dotsDecorator: DotsDecorator(
            activeColor: AppStyles.primaryColor,
            activeSize: const Size(20.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(2),
                right: Radius.circular(2),
              ),
            ),
          ),
          onDone: () => Routes.router.navigateTo(context, LoginPage.routeName),
          pages: onboardingContent
              .map((onboarding) => PageViewModel(
                    title: onboarding.title,
                    body: onboarding.body,
                    image: Image.network(onboarding.image),
                    decoration: pageDecoration,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
