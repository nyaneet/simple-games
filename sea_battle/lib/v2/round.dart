import 'package:sea_battle/v2/board/board.dart';
import 'package:sea_battle/v2/cell/cell.dart';
import 'package:sea_battle/v2/cells_view.dart';
import 'package:sea_battle/v2/pick/pick.dart';

class Round {
  final CellsView _cellsView;
  final Pick _playerPick;
  final Pick _enemyPick;

  Round({
    required CellsView cellsView,
    required Pick playerPick,
    required Pick enemyPick,
  })  : _cellsView = cellsView,
        _playerPick = playerPick,
        _enemyPick = enemyPick;

  /// Causes a selection of attack cells for each player
  ///
  /// Returns new boards of each player
  (List<List<Cell>>, List<List<Cell>>) value(
    List<List<Cell>> playerGrid,
    List<List<Cell>> enemyGrid,
  ) {
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
