import 'package:sea_battle/v2/cell/cell.dart';

class EmptyCell implements Cell {
  final bool _isAttacked;

  EmptyCell({bool isAttacked = false}) : _isAttacked = isAttacked;

  @override
  int value() {
    return _isAttacked ? 1 : 0;
  }

  @override
  bool isValuable() {
    return false;
  }

  @override
  bool isPickable() {
    return !_isAttacked;
  }

  @override
  EmptyCell copy() {
    return EmptyCell(isAttacked: _isAttacked);
  }

  @override
  EmptyCell attacked() {
    return EmptyCell(isAttacked: true);
  }
}
