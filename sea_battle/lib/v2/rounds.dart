import 'package:sea_battle/v2/board/board.dart';
import 'package:sea_battle/v2/cell/cell.dart';
import 'package:sea_battle/v2/round.dart';

class Rounds {
  final Round _round;
  final Board _playerBoard;
  final Board _enemyBoard;

  Rounds({
    required Round round,
    required Board playerBoard,
    required Board enemyBoard,
  })  : _round = round,
        _playerBoard = playerBoard,
        _enemyBoard = enemyBoard;

  /// Plays rounds until one player loses
  ///
  /// Returns true if main player has won
  bool result() {
    var (playerGrid, enemyGrid) = (_playerBoard.value(), _enemyBoard.value());

    while (true) {
      final enemyIsAlive = _playerIsAlive(enemyGrid);
      final playerIsAlive = _playerIsAlive(playerGrid);

      if (!enemyIsAlive) {
        return true;
      }
      if (!playerIsAlive) {
        return false;
      }

      (playerGrid, enemyGrid) = _round.value(playerGrid, enemyGrid);
    }
  }

  /// Returns true if player has a valuable cell
  bool _playerIsAlive(List<List<Cell>> playerGrid) {
    return playerGrid.any(
      (row) => row.any(
        (cell) => cell.isValuable(),
      ),
    );
  }
}
