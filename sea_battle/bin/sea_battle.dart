import 'package:sea_battle/v2/board/random_board.dart';
import 'package:sea_battle/v2/cell/empty_cell.dart';
import 'package:sea_battle/v2/cell/hidden_ship_cell.dart';
import 'package:sea_battle/v2/cell/ship_cell.dart';
import 'package:sea_battle/v2/cells_view.dart';
import 'package:sea_battle/v2/game.dart';
import 'package:sea_battle/v2/pick/input_pick.dart';
import 'package:sea_battle/v2/pick/random_pick.dart';
import 'package:sea_battle/v2/round.dart';
import 'package:sea_battle/v2/rounds.dart';

void main() {
  final int size = 3;

  final game = Game(
    rounds: Rounds(
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
      round: Round(
        cellsView: CellsView(
          viewMap: {0: '#', 1: 'M', 2: 'S', 3: 'H'},
        ),
        playerPick: InputPick(max: size),
        enemyPick: RandomPick(max: size),
      ),
    ),
  );

  game.play();
}
