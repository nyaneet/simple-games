import 'dart:io';

import 'package:sea_battle/pick/pick.dart';

class InputPick implements Pick {
  final int _max;

  InputPick({required int max}) : _max = max;

  @override
  (int, int) pick() {
    return (
      _parse('Please enter row number between 0 and $_max'),
      _parse('Please enter column number between 0 and $_max'),
    );
  }

  /// Returns the number entered by the user
  int _parse(String hint) {
    while (true) {
      print(hint);

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
