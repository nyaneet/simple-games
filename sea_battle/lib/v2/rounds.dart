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
    var firstPlayerBoard = _firstPlayer.setup();
    var secondPlayerBoard = _secondPlayer.setup();

    var roundNumber = 0;
    while (true) {
      var playerBoard =
          roundNumber.isEven ? firstPlayerBoard : secondPlayerBoard;
      var opponentBoard =
          roundNumber.isEven ? secondPlayerBoard : firstPlayerBoard;

      final player = roundNumber.isEven ? _firstPlayer : _secondPlayer;

      player.view(
        playerBoard: playerBoard,
        opponentBoard: opponentBoard,
      );

      (playerBoard, opponentBoard) = player.pick(
        playerBoard: playerBoard,
        opponentBoard: opponentBoard,
      );

      if (!_playerIsAlive(opponentBoard)) return roundNumber.isEven ? 0 : 1;

      firstPlayerBoard = roundNumber.isEven ? playerBoard : opponentBoard;
      secondPlayerBoard = roundNumber.isEven ? opponentBoard : playerBoard;

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
