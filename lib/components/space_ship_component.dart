import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:game_project/components/phantom_component.dart';
import 'package:game_project/constants/globals.dart';
import 'package:game_project/games/space_drift_game.dart';

enum MovementState { idle, slideLeft, slideRight, slideUp, slideDown, frozen }

class SpaceShipComponent extends SpriteGroupComponent<MovementState>
    with HasGameRef<SpaceDrift>, CollisionCallbacks {
  final double _spriteHeight = 100;

  final double _speed = 500;

  late double _rightBound;
  late double _leftBound;
  late double _upBound;
  late double _downBound;

  late JoystickComponent joystick;

  bool _frozen = false;
  final Timer _timer = Timer(3);

  SpaceShipComponent({required this.joystick});

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    Sprite shipIdle = await gameRef.loadSprite(Globals.spaceShipSprite);
    Sprite shipLeftSlide = await gameRef.loadSprite(Globals.spaceShipLeft);
    Sprite shipRightSlide = await gameRef.loadSprite(Globals.spaceShipRight);
    Sprite shipDownSlide = await gameRef.loadSprite(Globals.spaceShipDown);
    Sprite shipUpSlide = await gameRef.loadSprite(Globals.spaceShipUp);
    Sprite shipFrozen = await gameRef.loadSprite(Globals.freezShipUp);

    sprites = {
      MovementState.idle: shipIdle,
      MovementState.slideLeft: shipLeftSlide,
      MovementState.slideRight: shipRightSlide,
      MovementState.slideUp: shipUpSlide,
      MovementState.slideDown: shipDownSlide,
      MovementState.frozen: shipFrozen
    };

    _rightBound = gameRef.size.x - 45;
    _leftBound = -10;
    _upBound = 55;
    _downBound = gameRef.size.y - 85;

    current = MovementState.idle;

    position = gameRef.size / 2;
    height = _spriteHeight;
    width = 100;
    anchor = Anchor.center;
    add(CircleHitbox());
  }

  @override
  void update(dt) {
    super.update(dt);

    if (!_frozen) {
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

      bool movingLeft = joystick.direction == JoystickDirection.left;
      bool movingRight = joystick.direction == JoystickDirection.right;
      bool movingUp = joystick.direction == JoystickDirection.up;
      bool movingDown = joystick.direction == JoystickDirection.down;

      if (movingLeft) {
        current = MovementState.slideLeft;
      } else if (movingRight) {
        current = MovementState.slideRight;
      } else if (movingUp) {
        current = MovementState.slideUp;
      } else if (movingDown) {
        current = MovementState.slideDown;
      }

      position.add(joystick.relativeDelta * _speed * dt);
    } else {
      _timer.update(dt);
      if (_timer.finished) {
        _unfreezedShip();
      }
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is PhantomComponent) {
      _freezeShip();
    }
  }

  void _unfreezedShip() {
    _frozen = false;
    MovementState.idle;
  }

  void _freezeShip() {
    if (!_frozen) {
      FlameAudio.play(Globals.screamSound);
      _frozen = true;
      current = MovementState.frozen;
      _timer.start();
    }
  }
}
