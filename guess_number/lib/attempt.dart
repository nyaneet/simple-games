import 'package:guess_number/hint_difference.dart';

class Attempt {
  final HintDifference _hintDiff;

  Attempt({required HintDifference hintDiff}) : _hintDiff = hintDiff;
  Attempt.from(Attempt other) : this(hintDiff: other._hintDiff);

  bool match() {
    if (_hintDiff.value() == 0) return true;
    return false;
  }
}
