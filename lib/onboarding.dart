import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
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
            children: [
              Container(
                color: Colors.red,
                child: const Center(
                  child: Text("1"),
                ),
              ),
              Container(
                color: Colors.indigo,
                child: const Center(
                  child: Text("2"),
                ),
              ),
              Container(
                color: Colors.green,
                child: const Center(
                  child: Text("3"),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: ()=> controller.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut), child: const Text('SKIP')),
              Center(child: SmoothPageIndicator(
                controller:controller,
                count:3,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.black26,
                  activeDotColor: Colors.teal.shade700
                ),
              ),),
              TextButton(onPressed: ()=> controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut), child: const Text('NEXT'))
            ],
          ),
        ),
      );
}
