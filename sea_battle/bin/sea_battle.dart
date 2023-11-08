import 'package:sea_battle/v2/board/base_board_factory.dart';
import 'package:sea_battle/v2/board_setup/random_board_setup.dart';
import 'package:sea_battle/v2/cell/base_cell_factory.dart';
import 'package:sea_battle/v2/cell/cell.dart';
import 'package:sea_battle/v2/cells_view.dart';
import 'package:sea_battle/v2/game.dart';
import 'package:sea_battle/v2/pick/input_pick.dart';
import 'package:sea_battle/v2/pick/random_pick.dart';
import 'package:sea_battle/v2/pick_round.dart';
import 'package:sea_battle/v2/player.dart';
import 'package:sea_battle/v2/rounds.dart';
import 'package:sea_battle/v2/setup_round.dart';
import 'package:sea_battle/v2/view_round/detailed_view_round.dart';
import 'package:sea_battle/v2/view_round/hidden_view_round.dart';

void main() {
  final int size = 3;

  final firstPlayer = Player(
    setupRound: SetupRound(
      boardSetup: RandomBoardSetup(
        boardFactory: BaseBoardFactory(),
        cellFactory: BaseCellFactory(),
        size: (size, size),
      ),
    ),
    viewRound: DetailedViewRound(
      playerCellsView: CellsView(
        viewMap: {
          CellType.water: '_',
          CellType.miss: 'M',
          CellType.ship: 'S',
          CellType.hit: 'H',
        },
      ),
      opponentCellsView: CellsView(
        viewMap: {
          CellType.water: '_',
          CellType.miss: 'M',
          CellType.ship: '_',
          CellType.hit: 'H',
        },
      ),
    ),
    pickRound: PickRound(
      playerPick: InputPick(max: size),
    ),
  );

  final secondPlayer = Player(
    setupRound: SetupRound(
      boardSetup: RandomBoardSetup(
        boardFactory: BaseBoardFactory(),
        cellFactory: BaseCellFactory(),
        size: (size, size),
      ),
    ),
    viewRound: HiddenViewRound(message: 'Opponent makes a move...'),
    pickRound: PickRound(
      playerPick: RandomPick(max: size),
    ),
  );

  final game = Game(
    rounds: Rounds(
      firstPlayer: firstPlayer,
      secondPlayer: secondPlayer,
    ),
  );

  game.play();
}
