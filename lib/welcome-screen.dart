import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Space Drift',
                  style: TextStyle(
                      fontSize: 120,
                      // color: Color.fromARGB(255, 204, 0, 255),
                      color: Color.fromARGB(255, 255, 174, 0),
                      fontFamily: 'SpaceCrusaders'),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/game');
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 255, 174, 0),
                        fontFamily: 'SpaceCrusaders'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
