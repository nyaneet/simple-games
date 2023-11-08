import 'package:guess_number/attempt.dart';

class Attempts {
  final int _max;
  final Attempt _attempt;

  Attempts({required int max, required Attempt attempt})
      : _max = max,
        _attempt = attempt;

  bool matches() {
    for (var i = 0; i < _max; i++) {
      print('Attempts left: ${_max - i}');
      if (_attempt.match()) return true;
    }
    return false;
  }
}
