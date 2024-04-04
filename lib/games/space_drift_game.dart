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
import 'package:game_project/screens/game_over_menu.dart';

class SpaceDrift extends FlameGame with HasCollisionDetection {
  int score = 0;
  int level = 1;
  int _remainingTime = 30;
  late TextComponent _scoreText;
  late TextComponent _levelText;
  late TextComponent _timeText;
  late Timer _timer;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play('BG_Music.mp3');

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

    _timer = Timer(1, repeat: true, onTick: () {
      if (_remainingTime == 0) {
        pauseEngine();
        // overlays.add(GameOverMenu.ID);
      } else {
        _remainingTime -= 1;
      }
    });
    _timer.start();

    _scoreText = TextComponent(
      text: 'Score: $score',
      position: Vector2(10, 10),
    );
    add(_scoreText);

    _timeText = TextComponent(
      text: 'Time: $_remainingTime seconds',
      position: Vector2(650, 10),
    );
    add(_timeText);

    _levelText = TextComponent(
      text: 'Level: $level',
      position: Vector2(1220, 10),
    );
    add(_levelText);
  }

  void updateScoreText() {
    _scoreText.text = 'Score: $score';
  }

  void updateLevelText() {
    _levelText.text = 'Level: $level';
  }

  @override
  void update(dt) {
    super.update(dt);
    _timer.update(dt);
    _timeText.text = 'Time: $_remainingTime seconds';
  }

  void reset() {
    score = 0;
    _remainingTime = 30;
  }
}
