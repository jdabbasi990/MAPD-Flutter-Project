import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:game_project/constants/globals.dart';
import 'package:game_project/games/space_drift_game.dart';

class BackGroundComponent extends SpriteComponent with HasGameRef<SpaceDrift> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // sprite = await gameRef.loadSprite(Globals.backgroundSprite1);
    // size = gameRef.size;

    final background = await Flame.images.load(Globals.backgroundSprite2);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}
