import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';

import 'common/constants/global_constants.dart';
import 'components/card.dart';
import 'components/foundation_pile.dart';
import 'components/tableau_pile.dart';
import 'components/stock_pile.dart';
import 'components/waste_pile.dart';

class SolitaireGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await Flame.images.load('klondike-sprites.png');

    final StockPile stock = StockPile()
      ..size = cardSize
      ..position = Vector2(cardGap, cardGap);
    final WastePile waste = WastePile()
      ..size = cardSize
      ..position = Vector2(cardWidth + (2 * cardGap), cardGap);
    final List<FoundationPile> foundations = _generateFoundations(4);
    final List<TableauPile> piles = _generatePiles(7);

    world.addAll([stock, waste, ...foundations, ...piles]);
    _initCamera(camera);

    final cards = [
      for (int rank = 1; rank <= 13; rank++)
        for (int suit = 0; suit < 4; suit++) Card(rank, suit)
    ];
    cards.shuffle();
    world.addAll(cards);

    int cardToDeal = cards.length - 1;
    for (int i = 0; i < 7; i++) {
      for (int j = i; j < 7; j++) {
        piles[j].acquireCard(cards[cardToDeal--]);
      }
      piles[i].flipTopCard();
    }
    for (int n = 0; n <= cardToDeal; n++) {
      stock.acquireCard(cards[n]);
    }
  }
}

void _initCamera(CameraComponent camera) {
  camera.viewfinder.visibleGameSize = Vector2(
    (cardWidth * 7) + (cardGap * 8),
    (4 * cardHeight) + (3 * cardGap),
  );
  camera.viewfinder.position = Vector2(
    (cardWidth * 3.5) + (cardGap * 4),
    0,
  );
  camera.viewfinder.anchor = Anchor.topCenter;
}

List<FoundationPile> _generateFoundations(int count) {
  return List.generate(
    count,
    (i) {
      return FoundationPile(i)
        ..size = cardSize
        ..position = Vector2(
          (i + 3) * (cardWidth + cardGap) + cardGap,
          cardGap,
        );
    },
  );
}

List<TableauPile> _generatePiles(int count) {
  return List.generate(
    count,
    (i) {
      return TableauPile()
        ..size = cardSize
        ..position = Vector2(
          cardGap + i * (cardWidth + cardGap),
          cardHeight + 2 * cardGap,
        );
    },
  );
}

Sprite solitaireSprite(double x, double y, double width, double height) {
  return Sprite(
    Flame.images.fromCache('klondike-sprites.png'),
    srcPosition: Vector2(x, y),
    srcSize: Vector2(width, height),
  );
}
