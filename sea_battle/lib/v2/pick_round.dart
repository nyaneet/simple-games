import 'package:sea_battle/v2/cell/cell.dart';
import 'package:sea_battle/v2/board/board.dart';
import 'package:sea_battle/v2/pick/pick.dart';

class PickRound {
  final Pick _pick;

  PickRound({
    required Pick pick,
  }) : _pick = pick;

  (Board, Board) complete({
    required Board playerBoard,
    required Board opponentBoard,
  }) {
    final newOpponentGrid = _pickedGrid(
      opponentBoard.value(),
      _pick.pick(),
    );
    return (
      playerBoard,
      opponentBoard.restructured(cellGrid: newOpponentGrid),
    );
  }

  List<List<Cell>> _pickedGrid(List<List<Cell>> cellGrid, (int, int) pick) {
    final (i, j) = pick;
    return [
      ...cellGrid.sublist(0, i),
      [
        ...cellGrid[i].sublist(0, j),
        cellGrid[i][j].attacked(),
        ...cellGrid[i].sublist(j + 1),
      ],
      ...cellGrid.sublist(i + 1),
    ];
  }
}
