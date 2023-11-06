abstract interface class Cell {
  /// Returns cell value
  int value();

  /// Returns true if the cell prevents the player from losing
  bool isValuable();

  /// Returns true if the cell can be targeted for attack
  bool isPickable();

  // TODO replace methods below with factory probably

  /// Returns copy of the cell
  Cell copy();

  /// Returns the attacked copy of the cell
  Cell attacked();
}
