import 'package:flutter/material.dart';
import 'package:onboarding/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  bool isLastPage = false;
  final String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 2);
            },
            children: [
              buildPage(
                  urlImage: 'assets/1.png',
                  title: 'TRAVEL',
                  subtitle: loremIpsum),
              buildPage(
                  urlImage: 'assets/2.png',
                  title: 'TRAVEL',
                  subtitle: loremIpsum),
              buildPage(
                  urlImage: 'assets/3.png',
                  title: 'TRAVEL',
                  subtitle: loremIpsum)
            ],
          ),
        ),
        bottomSheet: isLastPage
            ? TextButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', true);

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomePage()));
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: 24),
                ),
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueGrey,
                    minimumSize: const Size.fromHeight(80)),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () => controller.jumpToPage(2),
                        child: Text(
                          'SKIP',
                          style: buildTextStyle(),
                        )),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: const WormEffect(
                            spacing: 16,
                            dotColor: Colors.black26,
                            activeDotColor: Colors.blueGrey),
                        onDotClicked: (index) => controller.animateToPage(index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn),
                      ),
                    ),
                    TextButton(
                        onPressed: () => controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut),
                        child: Text(
                          'NEXT',
                          style: buildTextStyle(),
                        ))
                  ],
                ),
              ),
      );

  TextStyle buildTextStyle() =>
      const TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold);

  Widget buildPage({
    required String urlImage,
    required String title,
    required String subtitle,
    Color? color,
  }) =>
      Container(
        color: color ?? Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              urlImage,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Text(
                subtitle,
                style: const TextStyle(color: Colors.blueGrey),
              ),
            )
          ],
        ),
      );
}
