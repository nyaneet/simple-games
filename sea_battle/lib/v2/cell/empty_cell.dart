import 'package:sea_battle/v2/cell/cell.dart';

class EmptyCell implements Cell {
  final bool _isAttacked;

  EmptyCell({bool isAttacked = false}) : _isAttacked = isAttacked;

  @override
  CellType value() {
    return _isAttacked ? CellType.miss : CellType.water;
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
  EmptyCell attacked() {
    return EmptyCell(isAttacked: true);
  }
}
