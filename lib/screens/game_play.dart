import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:game_project/games/space_drift_game.dart';
import 'package:game_project/screens/game_over_menu.dart';

final SpaceDrift _spaceDrift = SpaceDrift();

class GamePlay extends StatelessWidget {
  const GamePlay({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: _spaceDrift,
      overlayBuilderMap: {
        GameOverMenu.ID: (BuildContext context, SpaceDrift gameRef) =>
            GameOverMenu(gameRef: gameRef)
      },
    );
  }
}
