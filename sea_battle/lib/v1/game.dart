import 'package:sea_battle/v1/rounds.dart';

class Game {
  final Rounds _rounds;

  Game({required Rounds rounds}) : _rounds = rounds;

  /// Starts the game and displays the result
  void play() {
    print(_rounds.isWon() ? 'Victory!' : 'Defeat...');
  }
}
