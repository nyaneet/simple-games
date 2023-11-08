import 'dart:math';

import 'package:sea_battle/v2/board/board.dart';
import 'package:sea_battle/v2/board/board_factory.dart';
import 'package:sea_battle/v2/board_setup/board_setup.dart';
import 'package:sea_battle/v2/cell/cell_factory.dart';

class RandomBoardSetup implements BoardSetup {
  final BoardFactory _boardFactory;
  final CellFactory _cellFactory;
  final (int, int) _size;

  RandomBoardSetup({
    required BoardFactory boardFactory,
    required CellFactory cellFactory,
    required (int, int) size,
  })  : _boardFactory = boardFactory,
        _cellFactory = cellFactory,
        _size = size;

  @override
  Board value() {
    final (width, height) = _size;
    final (int, int) shipCoord = (
      Random().nextInt(height),
      Random().nextInt(width),
    );
    final cellGrid = List.generate(
      height,
      (i) => List.generate(
        width,
        (j) => (i, j) == shipCoord ? _cellFactory.ship() : _cellFactory.empty(),
      ),
    );
    return _boardFactory.board(cellGrid: cellGrid);
  }
}
