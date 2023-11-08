import 'package:sea_battle/v2/cell/cell.dart';
import 'package:sea_battle/v2/cell/empty_cell.dart';
import 'package:sea_battle/v2/cell/ship_cell.dart';
import 'package:sea_battle/v2/cell/cell_factory.dart';

class BaseCellFactory implements CellFactory {
  @override
  Cell empty({bool? isAttacked}) {
    return EmptyCell(isAttacked: isAttacked ?? false);
  }

  @override
  Cell ship({bool? isAttacked}) {
    return ShipCell(isAttacked: isAttacked ?? false);
  }
}
