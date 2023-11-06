import 'dart:math';

class Secret {
  final int _number;

  Secret({required int number}) : _number = number;
  Secret.from(Secret other) : this(number: other._number);
  Secret.random({required int max}) : this(number: Random().nextInt(max));

  int value() {
    return _number;
  }
}
