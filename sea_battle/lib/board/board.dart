import 'package:sea_battle/cell/cell.dart';

abstract interface class Board {
  /// Returns cell grid of the board as a value
  List<List<Cell>> value();
}
