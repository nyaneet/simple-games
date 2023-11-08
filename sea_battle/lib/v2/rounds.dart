import 'package:sea_battle/v2/board/board.dart';
import 'package:sea_battle/v2/player.dart';

class Rounds {
  final Player _firstPlayer;
  final Player _secondPlayer;

  Rounds({required Player firstPlayer, required Player secondPlayer})
      : _firstPlayer = firstPlayer,
        _secondPlayer = secondPlayer;

  /// Plays rounds until one player loses
  ///
  /// Returns the number of the winning player
  int result() {
    var (player, opponent) = (_firstPlayer, _secondPlayer);
    var (playerBoard, opponentBoard) = (player.setup(), opponent.setup());

    var roundNumber = 0;
    while (true) {
      // make the current player's move
      player.view(
        playerBoard: playerBoard,
        opponentBoard: opponentBoard,
      );

      (playerBoard, opponentBoard) = player.pick(
        playerBoard: playerBoard,
        opponentBoard: opponentBoard,
      );

      // check if the opponent has lost
      if (!_playerIsAlive(opponentBoard)) return roundNumber.isEven ? 0 : 1;

      // pass the turn to the next player
      (player, opponent) = (opponent, player);
      (playerBoard, opponentBoard) = (opponentBoard, playerBoard);
      roundNumber++;
    }
  }

  /// Returns true if player has a valuable cell
  bool _playerIsAlive(Board playerBoard) {
    return playerBoard.value().any(
          (row) => row.any(
            (cell) => cell.isValuable(),
          ),
        );
  }
}
