extension DoubleExtensions on double {
  String get converVoteAverageToPercentageString {
    double input = double.parse((this ?? 0.0).toStringAsFixed(1)) * 10;
    return '${input.toStringAsFixed(0)}%';
  }
}
