import 'package:sea_battle/v2/cell/cell.dart';

abstract interface class CellFactory {
  Cell empty();
  Cell ship();
}
