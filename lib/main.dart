import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game_project/games/space_drift_game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GameWidget(game: SpaceDrift()));
}
