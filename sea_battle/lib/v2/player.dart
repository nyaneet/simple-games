import 'package:sea_battle/v2/board/board.dart';
import 'package:sea_battle/v2/pick_round.dart';
import 'package:sea_battle/v2/setup_round.dart';
import 'package:sea_battle/v2/view_round/view_round.dart';

class Player {
  final SetupRound _setupRound;
  final ViewRound _viewRound;
  final PickRound _pickRound;

  Player({
    required SetupRound setupRound,
    required ViewRound viewRound,
    required PickRound pickRound,
  })  : _setupRound = setupRound,
        _viewRound = viewRound,
        _pickRound = pickRound;

  Board setup() {
    return _setupRound.complete();
  }

  void view({
    required Board playerBoard,
    required Board opponentBoard,
  }) {
    _viewRound.complete(
      playerBoard: playerBoard,
      opponentBoard: opponentBoard,
    );
  }

  (Board, Board) pick({
    required Board playerBoard,
    required Board opponentBoard,
  }) {
    return _pickRound.complete(
      playerBoard: playerBoard,
      opponentBoard: opponentBoard,
    );
  }
}
