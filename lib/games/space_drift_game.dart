import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:game_project/components/background_component.dart';
import 'package:game_project/components/flame_component.dart';
import 'package:game_project/components/phantom_component.dart';
import 'package:game_project/components/space_ship_component.dart';
import 'package:game_project/constants/globals.dart';
import 'package:game_project/inputs/joystick.dart';

class SpaceDrift extends FlameGame with HasCollisionDetection {
  int score = 0;
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(BackGroundComponent());
    add(SpaceShipComponent(joystick: joystick));

    add(FlamePointComponent());

    add(joystick);

    FlameAudio.audioCache.loadAll([
      Globals.itemGrabSound,
    ]);

    add(PhantomComponent(startPosition: Vector2(200, 200)));
    add(PhantomComponent(startPosition: Vector2(size.x - 200, size.y - 200)));
  }
}
