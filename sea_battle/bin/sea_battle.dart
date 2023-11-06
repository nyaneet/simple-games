import 'package:sea_battle/board/random_board.dart';
import 'package:sea_battle/cell/empty_cell.dart';
import 'package:sea_battle/cell/hidden_ship_cell.dart';
import 'package:sea_battle/cell/ship_cell.dart';
import 'package:sea_battle/cells_view.dart';
import 'package:sea_battle/game.dart';
import 'package:sea_battle/pick/input_pick.dart';
import 'package:sea_battle/pick/random_pick.dart';
import 'package:sea_battle/round.dart';
import 'package:sea_battle/rounds.dart';

void main() {
  final int size = 3;

  final game = Game(
    rounds: Rounds(
      currentRound: Round(
        cellsView: CellsView(
          viewMap: {0: '#', 1: 'M', 2: 'S', 3: 'H'},
        ),
        playerBoard: RandomBoard(
          size: size,
          emptyCell: EmptyCell(),
          shipCell: ShipCell(),
        ),
        enemyBoard: RandomBoard(
          size: size,
          emptyCell: EmptyCell(),
          shipCell: HiddenShipCell(),
        ),
        playerPick: InputPick(max: size),
        enemyPick: RandomPick(max: size),
      ),
    ),
  );

  game.play();
}
