import 'package:sea_battle/v2/cell/cell.dart';

class CellsView {
  final Map<CellType, String> _cellViewsMap;

  CellsView({
    required Map<CellType, String> viewMap,
  }) : _cellViewsMap = viewMap;

  /// Returns pretty view of cell grid
  String render(List<List<Cell>> cellGrid) {
    final rowMarks = List.generate(
      cellGrid.length,
      (index) => index.toString(),
    ).toList();
    final colMarks = List.generate(
      cellGrid[0].length,
      (index) => index.toString(),
    ).toList();

    var rowIdx = 0;
    final prettyGridView = cellGrid.fold('#${colMarks.join()}', (prev, row) {
      final prettyRowView = row.fold('\n${rowMarks[rowIdx++]}', (prev, cell) {
        return prev + (_cellViewsMap[cell.value()] ?? '?');
      });
      return prev + prettyRowView;
    });

    return prettyGridView;
  }
}
