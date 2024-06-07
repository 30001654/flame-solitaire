import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flame_solitare_tutorial/solitaire_game.dart';
import 'package:flutter/painting.dart';

const double cardWidth = 1000.0;
const double cardHeight = 1400.0;
const double cardGap = 175.0;
const double cardRadius = 100.0;
final Vector2 cardSize = Vector2(cardWidth, cardHeight);

final Paint backBackgroundPaint = Paint()..color = const Color(0xff380c02);
final Paint backBorderPaint1 = Paint()
  ..color = const Color(0xffdbaf58)
  ..style = PaintingStyle.stroke
  ..strokeWidth = 10;
final Paint backBorderPaint2 = Paint()
  ..color = const Color(0x5CEF971B)
  ..style = PaintingStyle.stroke
  ..strokeWidth = 35;
final RRect cardRRect = RRect.fromRectAndRadius(
  cardSize.toRect(),
  const Radius.circular(cardRadius),
);
final RRect backRRectInner = cardRRect.deflate(40);
final Sprite flameSprite = solitaireSprite(1367, 6, 357, 501);

final blueFilter = Paint()
  ..colorFilter = const ColorFilter.mode(
    Color(0x880d8bff),
    BlendMode.srcATop,
  );
final Sprite blackJack = solitaireSprite(81, 565, 562, 488)..paint = blueFilter;
final Sprite blackQueen = solitaireSprite(717, 541, 486, 515)
  ..paint = blueFilter;
final Sprite blackKing = solitaireSprite(1305, 532, 407, 549)
  ..paint = blueFilter;

final Sprite redJack = solitaireSprite(81, 565, 562, 488);
final Sprite redQueen = solitaireSprite(717, 541, 486, 515);
final Sprite redKing = solitaireSprite(1305, 532, 407, 549);

final Paint frontBackgroundPaint = Paint()..color = const Color(0xff000000);
final Paint redBorderPaint = Paint()
  ..color = const Color(0xffece8a3)
  ..style = PaintingStyle.stroke
  ..strokeWidth = 10;
final Paint blackBorderPaint = Paint()
  ..color = const Color(0xff7ab2e8)
  ..style = PaintingStyle.stroke
  ..strokeWidth = 10;
