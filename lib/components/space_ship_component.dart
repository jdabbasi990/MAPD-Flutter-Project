import 'package:flame/components.dart';
import 'package:game_project/constants/globals.dart';
import 'package:game_project/games/space_drift_game.dart';

enum MovementState {
  idle,
  slideLeft,
  slideRight,
}

class SpaceShipComponent extends SpriteGroupComponent<MovementState>
    with HasGameRef<SpaceDrift> {
  final double _spriteHeight = 100;

  final double _speed = 500;

  late double _rightBound;
  late double _leftBound;
  late double _upBound;
  late double _downBound;

  late JoystickComponent joystick;

  SpaceShipComponent({required this.joystick});

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    Sprite shipIdle = await gameRef.loadSprite(Globals.spaceShipSprite);
    Sprite shipLeftSlide = await gameRef.loadSprite(Globals.spaceShipLeft);
    Sprite shipRightSlide = await gameRef.loadSprite(Globals.spaceShipRight);

    sprites = {
      MovementState.idle: shipIdle,
      MovementState.slideLeft: shipLeftSlide,
      MovementState.slideRight: shipRightSlide,
    };

    _rightBound = gameRef.size.x - 45;
    _leftBound = -45;
    _upBound = 55;
    _downBound = gameRef.size.y - 85;

    current = MovementState.idle;

    position = gameRef.size / 2;
    height = _spriteHeight;
    width = 100;
    anchor = Anchor.center;
  }

  @override
  void update(dt) {
    super.update(dt);

    if (joystick.direction == JoystickDirection.idle) {
      current = MovementState.idle;
      return;
    }
    if (x >= _rightBound) {
      x = _rightBound - 1;
    }
    if (x <= _leftBound) {
      x = _leftBound + 1;
    }
    if (y <= _upBound) {
      y = _upBound + 1;
    }
    if (y >= _downBound) {
      y = _downBound - 1;
    }

    bool movingLeft = joystick.relativeDelta[0] < 0;

    if (movingLeft) {
      current = MovementState.slideLeft;
    } else {
      current = MovementState.slideRight;
    }

    position.add(joystick.relativeDelta * _speed * dt);
  }
}
