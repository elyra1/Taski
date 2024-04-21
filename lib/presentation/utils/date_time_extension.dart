extension DateTimeCompareExt on DateTime {
  bool isSame(DateTime other) {
    return year == other.year &&
        month == other.month &&
        day == other.day &&
        minute == other.minute &&
        second == other.second;
  }
}
