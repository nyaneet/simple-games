import 'package:guess_number/difference.dart';

class HintDifference {
  final Difference _diff;

  HintDifference({required Difference diff}) : _diff = diff;

  int value() {
    final diff = _diff.value();
    if (diff > 0) print('Too big');
    if (diff < 0) print('Too small');
    return diff;
  }
}
