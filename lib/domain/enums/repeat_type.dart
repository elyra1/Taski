enum RepeatType {
  day,
  week,
  month,
  never;
}

extension RepeateToValue on RepeatType {
  String toValue() {
    switch (this) {
      case RepeatType.never:
        return "never";
      case RepeatType.day:
        return "day";
      case RepeatType.week:
        return "week";
      case RepeatType.month:
        return "month";
      default:
        return "never";
    }
  }
}

abstract class RepeatTypeHelper {
  static List<(String, RepeatType)> get repeatValuesList => [
        ("никогда", RepeatType.never),
        ("каждый день", RepeatType.day),
        ("каждую неделю", RepeatType.week),
        ("каждый месяц", RepeatType.month),
      ];

  static RepeatType fromValue(String value) {
    switch (value) {
      case "never":
        return RepeatType.never;
      case "day":
        return RepeatType.day;
      case "week":
        return RepeatType.week;
      case "month":
        return RepeatType.month;
      default:
        return RepeatType.never;
    }
  }
}
