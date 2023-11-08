import 'package:sea_battle/v2/cell/cell.dart';

class ShipCell implements Cell {
  final bool _isAttacked;

  ShipCell({bool isAttacked = false}) : _isAttacked = isAttacked;

  @override
  CellType value() {
    return _isAttacked ? CellType.hit : CellType.ship;
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
  ShipCell attacked() {
    return ShipCell(isAttacked: true);
  }
}
