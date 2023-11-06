import 'package:sea_battle/v2/cell/cell.dart';

class CellsView {
  final Map<int, String> _viewMap;

  CellsView({
    required viewMap,
  }) : _viewMap = viewMap;

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
        return prev + (_viewMap[cell.value()] ?? '?');
      });
      return prev + prettyRowView;
    });

    return prettyGridView;
  }
}
