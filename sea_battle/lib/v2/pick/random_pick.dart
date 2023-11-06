import 'dart:math';

import 'package:sea_battle/v2/pick/pick.dart';

class RandomPick implements Pick {
  final int _max;

  RandomPick({required int max}) : _max = max;

  @override
  (int, int) pick() {
    return (Random().nextInt(_max), Random().nextInt(_max));
  }
}
