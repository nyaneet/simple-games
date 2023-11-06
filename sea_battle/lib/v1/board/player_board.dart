import 'package:sea_battle/v1/board/board.dart';
import 'package:sea_battle/v1/cell/cell.dart';

class PlayerBoard implements Board {
  final List<List<Cell>> _cellGrid;

  PlayerBoard({required List<List<Cell>> cellGrid}) : _cellGrid = cellGrid;

  @override
  List<List<Cell>> value() {
    return _cellGrid;
  }
}
