import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';

import 'solitaire_game.dart';


void main() {
  final game = SolitaireGame();
  runApp(GameWidget(game: game));
}