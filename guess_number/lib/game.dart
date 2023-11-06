import 'package:guess_number/attempts.dart';
import 'package:guess_number/secret.dart';

class Game {
  final Attempts _attempts;
  final Secret _secret;

  Game({required Attempts attempts, required Secret secret})
      : _attempts = attempts,
        _secret = secret;

  void play() {
    if (_attempts.matches()) {
      print('You won.');
    } else {
      print('You lost, secret is ${_secret.value()}');
    }
  }
}
