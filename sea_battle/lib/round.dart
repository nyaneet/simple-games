import 'package:sea_battle/board/board.dart';
import 'package:sea_battle/cell/cell.dart';
import 'package:sea_battle/cells_view.dart';
import 'package:sea_battle/pick/pick.dart';

class Round {
  final CellsView _cellsView;
  final Board _playerBoard;
  final Board _enemyBoard;
  final Pick _playerPick;
  final Pick _enemyPick;

  Round({
    required CellsView cellsView,
    required Board playerBoard,
    required Board enemyBoard,
    required Pick playerPick,
    required Pick enemyPick,
  })  : _cellsView = cellsView,
        _playerBoard = playerBoard,
        _enemyBoard = enemyBoard,
        _playerPick = playerPick,
        _enemyPick = enemyPick;

  Round copyWith({
    CellsView? cellsView,
    Board? playerBoard,
    Pick? playerPick,
    Board? enemyBoard,
    Pick? enemyPick,
  }) {
    return Round(
      cellsView: cellsView ?? _cellsView,
      playerBoard: playerBoard ?? _playerBoard,
      playerPick: playerPick ?? _playerPick,
      enemyBoard: enemyBoard ?? _enemyBoard,
      enemyPick: enemyPick ?? _enemyPick,
    );
  }

  /// Causes a selection of attack cells for each player
  ///
  /// Returns new boards of each player
  (List<List<Cell>>, List<List<Cell>>) value() {
    final playerGrid = _playerBoard.value();
    final enemyGrid = _enemyBoard.value();

    final playerView = _cellsView.render(playerGrid);
    print('Your board:\n$playerView');
    final enemyView = _cellsView.render(enemyGrid);
    print('Enemy board:\n$enemyView');

    final playerPick = _playerPick.pick();
    final enemyPick = _enemyPick.pick();

    final newPlayerGrid = _pickedGrid(playerGrid, enemyPick);
    final newEnemyGrid = _pickedGrid(enemyGrid, playerPick);

    return (newPlayerGrid, newEnemyGrid);
  }

  /// Returns new cell grid with the selected cell attacked
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
