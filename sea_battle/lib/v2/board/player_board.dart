import 'package:sea_battle/v2/board/board.dart';
import 'package:sea_battle/v2/cell/cell.dart';

class PlayerBoard implements Board {
  final List<List<Cell>> _cellGrid;

  PlayerBoard({required List<List<Cell>> cellGrid}) : _cellGrid = cellGrid;

  @override
  List<List<Cell>> value() {
    return _cellGrid;
  }

  @override
  PlayerBoard restructured({required List<List<Cell>> cellGrid}) {
    return PlayerBoard(cellGrid: cellGrid);
  }
}
