import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:game_project/components/background_component.dart';
import 'package:game_project/components/flame_component.dart';
import 'package:game_project/components/phantom_component.dart';
import 'package:game_project/components/space_ship_component.dart';
import 'package:game_project/constants/globals.dart';
import 'package:game_project/inputs/joystick.dart';

class SpaceDrift extends FlameGame with HasCollisionDetection {
  int score = 0;
  int level = 1;
  late TextComponent scoreText;
  late TextComponent levelText;
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(BackGroundComponent());
    add(SpaceShipComponent(joystick: joystick));

    add(FlamePointComponent());

    add(joystick);

    FlameAudio.audioCache.loadAll(
      [Globals.itemGrabSound, Globals.screamSound],
    );

    add(PhantomComponent(startPosition: Vector2(200, 200)));
    add(PhantomComponent(startPosition: Vector2(size.x - 200, size.y - 200)));

    add(ScreenHitbox());

    scoreText = TextComponent(
      text: 'Score: $score',
      position: Vector2(10, 10), // Adjust position as needed
    );
    add(scoreText);

    levelText = TextComponent(
      text: 'Level: $level',
      position: Vector2(650,10),
    );
    add(levelText);

  }
  void updateScoreText() {
    scoreText.text = 'Score: $score';
  }

  void updateLevelText(){
    levelText.text = 'Level: $level';
  }
  }

