enum CellType {
  water,
  ship,
  hit,
  miss,
}

abstract interface class Cell {
  /// Returns cell type as value
  CellType value();

  /// Returns true if the cell prevents the player from losing
  bool isValuable();

  /// Returns true if the cell can be targeted for attack
  bool isPickable();

  /// Returns the attacked copy of the cell
  Cell attacked();
}
