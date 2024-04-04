import 'package:flutter/material.dart';
import 'package:game_project/constants/globals.dart';
import 'package:game_project/games/space_drift_game.dart';

class GameOverMenu extends StatelessWidget {
  static const String ID = 'GameOverMenu';
  final SpaceDrift gameRef;

  const GameOverMenu({Key? key, required this.gameRef}) : super(key: key);

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
                  'Game Over',
                  style: TextStyle(fontSize: 100),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Text('score: ${gameRef.score}'),
              ),
              SizedBox(
                width: 400,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {
                    gameRef.overlays.remove(GameOverMenu.ID);
                    gameRef.reset();
                    gameRef.resumeEngine();
                  },
                  child: const Text(
                    'Play Again',
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
