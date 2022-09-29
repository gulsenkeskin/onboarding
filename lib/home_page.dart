import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          actions: [
            IconButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', false);

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const OnboardingPage()));
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: const Center(
          child: Text(
            'Home',
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
}
