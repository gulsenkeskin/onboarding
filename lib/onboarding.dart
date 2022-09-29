import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context)=> Scaffold(
    body: Container(
      padding: const EdgeInsets.only(bottom: 80),
      child: PageView(
        children: [
          Container(
            color: Colors.red,
            child: const Center(child: Text("1"),),
          ),
          Container(
            color: Colors.indigo,
            child: const Center(child: Text("2"),),
          ),
          Container(
            color: Colors.green,
            child: const Center(child: Text("3"),),
          ),
        ],
      ),
    ),
  );
}