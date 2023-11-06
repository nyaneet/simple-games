import 'dart:io';

class Guess {
  final int _max;

  Guess({required max}) : _max = max;
  Guess.from(Guess other) : this(max: other._max);

  int value() {
    return _parse();
  }

  int _parse() {
    while (true) {
      print('Please enter a number between 0 and $_max...');

      final input = stdin.readLineSync() ?? '';
      final value = int.tryParse(input);

      if (value != null && value >= 0 && value < _max) {
        return value;
      } else {
        print('Please enter a valid value.');
      }
    }
  }
}
