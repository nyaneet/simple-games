import 'package:sea_battle/v2/rounds.dart';

class Game {
  final Rounds _rounds;

  Game({required Rounds rounds}) : _rounds = rounds;

  /// Starts the game and displays the result
  void play() {
    final winner = _rounds.result();
    print('Player ${winner + 1} won.');
  }
}
