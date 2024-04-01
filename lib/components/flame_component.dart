import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:game_project/components/phantom_component.dart';
import 'package:game_project/components/space_ship_component.dart';
import 'package:game_project/constants/globals.dart';
import 'package:game_project/games/space_drift_game.dart';

class FlamePointComponent extends SpriteComponent
    with HasGameRef<SpaceDrift>, CollisionCallbacks {
  final double _spriteHeight = 50;
  final Random _random = Random();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.flameSprite);
    size = gameRef.size;
    height = width = _spriteHeight;
    position = getRandomPosition();
    anchor = Anchor.center;

    add(CircleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is SpaceShipComponent) {
      FlameAudio.play(Globals.itemGrabSound);

      removeFromParent();
      gameRef.score += 1;

      if (gameRef.score == 3) {
        gameRef.add(PhantomComponent(startPosition: Vector2(100, 100)));
      }

      if (gameRef.score == 5){
        gameRef.add(PhantomComponent(startPosition: Vector2(100, 100)));
        gameRef.score = 0;
        gameRef.level +=1;
      }

      gameRef.updateLevelText();
      // Update score on screen
      gameRef.updateScoreText();

      gameRef.add(FlamePointComponent());
    }
  }

  Vector2 getRandomPosition() {
    double x = _random.nextInt(gameRef.size.x.toInt()).toDouble();
    double y = _random.nextInt(gameRef.size.y.toInt()).toDouble();
    return Vector2(x, y);
  }
}
