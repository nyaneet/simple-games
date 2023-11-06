import 'package:guess_number/attempt.dart';

class Attempts {
  final int _left;
  final Attempt _current;

  Attempts({required int left, required Attempt current})
      : _left = left,
        _current = current;

  bool matches() {
    print('Attempts left: $_left.');
    if (_left > 0 && _current.match()) {
      return true;
    }
    if (_left > 0) {
      return Attempts(
        left: _left - 1,
        current: Attempt.from(_current),
      ).matches();
    }
    return false;
  }
}
