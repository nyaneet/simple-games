import 'package:sea_battle/cell/cell.dart';

class HiddenShipCell implements Cell {
  final bool _isAttacked;

  HiddenShipCell({bool isAttacked = false}) : _isAttacked = isAttacked;

  @override
  int value() {
    return _isAttacked ? 3 : 0;
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
  HiddenShipCell copy() {
    return HiddenShipCell(isAttacked: _isAttacked);
  }

  @override
  HiddenShipCell attacked() {
    return HiddenShipCell(isAttacked: true);
  }
}
