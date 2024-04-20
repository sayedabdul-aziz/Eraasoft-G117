import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety_4_5/core/functions/routing.dart';
import 'package:se7ety_4_5/core/utils/colors.dart';
import 'package:se7ety_4_5/core/utils/styles.dart';
import 'package:se7ety_4_5/core/widgets/custom_button.dart';
import 'package:se7ety_4_5/features/intro/onboarding/onboarding_model.dart';
import 'package:se7ety_4_5/features/intro/welcome_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  var pageController = PageController();
  int lastIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        actions: [
          if (lastIndex != 2)
            TextButton(
              onPressed: () {
                pushToWithReplacement(context, const WelcomeView());
              },
              child: const Text('تخطي'),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: pageController,
                  itemCount: pages.length,
                  onPageChanged: (value) {
                    setState(() {
                      lastIndex = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(children: [
                      const Spacer(),
                      SvgPicture.asset(
                        pages[index].image,
                        width: 300,
                      ),
                      const Spacer(),
                      Text(
                        pages[index].title,
                        style: getTitleStyle(),
                      ),
                      const Gap(30),
                      Text(
                        pages[index].description,
                        textAlign: TextAlign.center,
                        style: getbodyStyle(),
                      ),
                      const Spacer(
                        flex: 2,
                      )
                    ]);
                  }),
            ),
            SizedBox(
                height: 70,
                child: Row(
                  children: [
                    SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: WormEffect(
                          activeDotColor: AppColors.color1,
                          dotWidth: 20,
                          dotHeight: 10),
                    ),
                    const Spacer(),
                    if (lastIndex == 2)
                      CustomButton(
                          style: getTitleStyle(
                              fontSize: 16, color: AppColors.white),
                          radius: 10,
                          height: 45,
                          width: 100,
                          text: 'هيا بنا',
                          onPressed: () {
                            pushToWithReplacement(context, const WelcomeView());
                          })
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
