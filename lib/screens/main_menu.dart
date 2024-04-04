import 'package:flutter/material.dart';
import 'package:game_project/constants/globals.dart';
import 'package:game_project/screens/game_play.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/${Globals.backgroundSprite1}"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Text(
                  'Space Drift',
                  style: TextStyle(fontSize: 100),
                ),
              ),
              SizedBox(
                width: 400,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => GamePlay()));
                  },
                  child: const Text(
                    'Play',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
