extension StringUtils on String {
  double get doubleValue {
    if (isEmpty) return 0.0;
    final normalized = replaceAll(",", ".");
    return double.parse(normalized);
  }
}
