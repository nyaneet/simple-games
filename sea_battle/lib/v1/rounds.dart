import 'package:sea_battle/v1/board/player_board.dart';
import 'package:sea_battle/v1/round.dart';

class Rounds {
  final Round _currentRound;

  Rounds({required Round currentRound}) : _currentRound = currentRound;

  /// Plays rounds until one player loses
  ///
  /// Returns true if main player has won
  bool isWon() {
    final (playerGrid, enemyGrid) = _currentRound.value();

    final enemyIsAlive = enemyGrid.any(
      (row) => row.any(
        (cell) => cell.isValuable(),
      ),
    );
    final playerIsAlive = playerGrid.any(
      (row) => row.any(
        (cell) => cell.isValuable(),
      ),
    );

    if (!enemyIsAlive) {
      return true;
    }
    if (!playerIsAlive) {
      return false;
    }
    return Rounds(
      currentRound: _currentRound.copyWith(
        playerBoard: PlayerBoard(cellGrid: playerGrid),
        enemyBoard: PlayerBoard(cellGrid: enemyGrid),
      ),
    ).isWon();
  }
}
