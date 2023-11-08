import 'package:guess_number/attempt.dart';
import 'package:guess_number/attempts.dart';
import 'package:guess_number/difference.dart';
import 'package:guess_number/game.dart';
import 'package:guess_number/guess.dart';
import 'package:guess_number/hint_difference.dart';
import 'package:guess_number/secret.dart';

void main() {
  final maxNumber = 30;
  final maxTries = 5;
  final secret = Secret.random(max: maxNumber);

  final game = Game(
    attempts: Attempts(
      attempt: Attempt(
        hintDiff: HintDifference(
          diff: Difference(
            secret: Secret.from(secret),
            guess: Guess(max: maxNumber),
          ),
        ),
      ),
      max: maxTries,
    ),
    secret: Secret.from(secret),
  );

  game.play();
}
