import 'package:sea_battle/v1/cell/cell.dart';

abstract interface class Board {
  /// Returns cell grid of the board as a value
  List<List<Cell>> value();
}
