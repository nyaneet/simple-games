import 'package:sea_battle/v2/cell/cell.dart';

class ShipCell implements Cell {
  final bool _isAttacked;

  ShipCell({bool isAttacked = false}) : _isAttacked = isAttacked;

  @override
  int value() {
    return _isAttacked ? 3 : 2;
  }

  @override
  bool isValuable() {
    return !_isAttacked;
  }

  @override
  bool isPickable() {
    return !_isAttacked;
  }

  @override
  ShipCell copy() {
    return ShipCell(isAttacked: _isAttacked);
  }

  @override
  ShipCell attacked() {
    return ShipCell(isAttacked: true);
  }
}
