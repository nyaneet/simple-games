import 'package:sea_battle/v2/board/board.dart';
import 'package:sea_battle/v2/view_round/view_round.dart';

class HiddenViewRound implements ViewRound {
  final String _message;

  HiddenViewRound({required message}) : _message = message;

  @override
  void complete({
    required Board playerBoard,
    required Board opponentBoard,
  }) {
    print(_message);
  }
}
