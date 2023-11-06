import 'package:guess_number/guess.dart';
import 'package:guess_number/secret.dart';

class Difference {
  final Secret _secret;
  final Guess _guess;

  Difference({required Secret secret, required Guess guess})
      : _secret = secret,
        _guess = guess;

  int value() {
    return _guess.value() - _secret.value();
  }
}
