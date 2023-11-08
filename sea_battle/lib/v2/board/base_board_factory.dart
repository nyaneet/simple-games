import 'package:sea_battle/v2/board/player_board.dart';
import 'package:sea_battle/v2/board/board_factory.dart';
import 'package:sea_battle/v2/cell/cell.dart';

class BaseBoardFactory implements BoardFactory {
  @override
  PlayerBoard board({required List<List<Cell>> cellGrid}) {
    return PlayerBoard(cellGrid: cellGrid);
  }
}
