import 'package:sea_battle/v2/board/board.dart';
import 'package:sea_battle/v2/cell/cell.dart';

abstract class BoardFactory {
  Board board({required List<List<Cell>> cellGrid});
}
