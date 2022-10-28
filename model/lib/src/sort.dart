enum SortType {
  /// Sort by the name of the item.
  name('Name'),

  /// Sort by the date the item was last modified.
  date('Date'),

  /// Sort by the size of the item.
  size('Size');

  const SortType(this.value);
  final String value;
}
