import 'package:flame/game.dart';
import 'package:game_project/components/background_component.dart';
import 'package:game_project/components/space_ship_component.dart';
import 'package:game_project/inputs/joystick.dart';

class SpaceDrift extends FlameGame {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(BackGroundComponent());
    add(SpaceShipComponent());
    add(joystick);
  }
}
