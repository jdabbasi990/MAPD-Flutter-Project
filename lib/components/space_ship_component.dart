import 'package:flame/components.dart';
import 'package:game_project/constants/globals.dart';
import 'package:game_project/games/space_drift_game.dart';

class SpaceShipComponent extends SpriteComponent with HasGameRef<SpaceDrift> {
  final double _spriteHeight = 100;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.spaceShipSprite);
    position = gameRef.size / 2;
    height = _spriteHeight;
    width = 100;
    anchor = Anchor.center;
  }
}
