import 'package:flame/components.dart';
import 'package:game_project/constants/globals.dart';
import 'package:game_project/games/space_drift_game.dart';

class BackGroundComponent extends SpriteComponent with HasGameRef<SpaceDrift> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.backgroundSprite);
    size = gameRef.size;
  }
}
