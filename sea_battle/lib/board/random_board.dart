import 'dart:math';

import 'package:sea_battle/board/board.dart';
import 'package:sea_battle/cell/cell.dart';

class RandomBoard implements Board {
  final int _size;
  final Cell _emptyCell;
  final Cell _shipCell;

  RandomBoard({
    required int size,
    required Cell emptyCell,
    required Cell shipCell,
  })  : _size = size,
        _emptyCell = emptyCell,
        _shipCell = shipCell;

  @override
  List<List<Cell>> value() {
    final (int, int) shipCoord = (
      Random().nextInt(_size),
      Random().nextInt(_size),
    );
    return List.generate(
      _size,
      (i) => List.generate(
        _size,
        (j) => (i, j) == shipCoord ? _shipCell.copy() : _emptyCell.copy(),
      ),
    );
  }
}
