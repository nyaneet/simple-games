import 'package:sea_battle/v2/board/board.dart';

abstract interface class ViewRound {
  /// Shows the current player's round view
  void complete({
    required Board playerBoard,
    required Board opponentBoard,
  });
}
