import 'package:flame/game.dart';
import 'package:game_project/components/background_component.dart';
import 'package:game_project/components/space-ship_component.dart';

class SpaceDrift extends FlameGame {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(BackGroundComponent());
    add(SpaceShipComponent());
  }
}
