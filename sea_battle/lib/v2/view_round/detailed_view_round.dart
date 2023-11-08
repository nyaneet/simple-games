import 'package:sea_battle/v2/board/board.dart';
import 'package:sea_battle/v2/cells_view.dart';
import 'package:sea_battle/v2/view_round/view_round.dart';

class DetailedViewRound implements ViewRound {
  final CellsView _playerCellsView;
  final CellsView _opponentCellsView;

  DetailedViewRound(
      {required CellsView playerCellsView,
      required CellsView opponentCellsView})
      : _playerCellsView = playerCellsView,
        _opponentCellsView = opponentCellsView;

  @override
  void complete({required Board playerBoard, required Board opponentBoard}) {
    final (playerGrid, opponentGrid) = (
      playerBoard.value(),
      opponentBoard.value(),
    );

    final (playerGridView, opponentGridView) = (
      _playerCellsView.render(playerGrid),
      _opponentCellsView.render(opponentGrid),
    );

    print('Your board:\n$playerGridView\n');
    print('Enemy board:\n$opponentGridView\n');
  }
}
