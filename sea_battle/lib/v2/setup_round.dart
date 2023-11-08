import 'package:sea_battle/v2/board/board.dart';
import 'package:sea_battle/v2/board_setup/board_setup.dart';

class SetupRound {
  final BoardSetup _boardSetup;

  SetupRound({required BoardSetup boardSetup}) : _boardSetup = boardSetup;

  Board complete() {
    return _boardSetup.value();
  }
}
