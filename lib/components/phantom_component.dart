import 'package:flame/components.dart';
import 'package:game_project/constants/globals.dart';
import 'package:game_project/games/space_drift_game.dart';

class PhantomComponent extends SpriteComponent with HasGameRef<SpaceDrift> {
  final double _spriteHeight = 100;
  final Vector2 startPosition;

  PhantomComponent({required this.startPosition});
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.phantomSprite);
    position = startPosition;
    width = height = _spriteHeight;
    anchor = Anchor.center;
  }
}
