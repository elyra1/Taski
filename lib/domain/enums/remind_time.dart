enum RemindTime {
  min5,
  min10,
  min15,
  min30,
  hour1,
  none;
}

extension RemindValue on RemindTime {
  int toValue() {
    switch (this) {
      case RemindTime.min5:
        return 300;
      case RemindTime.min10:
        return 600;
      case RemindTime.min15:
        return 900;
      case RemindTime.min30:
        return 1800;
      case RemindTime.hour1:
        return 3600;
      default:
        return 0;
    }
  }
}

abstract class RemindTimeHelper {
  static List<(String, RemindTime)> get remindValuesList => [
        ("5 мин", RemindTime.min5),
        ("10 мин", RemindTime.min10),
        ("15 мин", RemindTime.min15),
        ("30 мин", RemindTime.min30),
        ("1 час", RemindTime.hour1)
      ];

  static RemindTime fromValue(int seconds) {
    switch (seconds) {
      case 300:
        return RemindTime.min5;
      case 600:
        return RemindTime.min10;
      case 900:
        return RemindTime.min15;
      case 1800:
        return RemindTime.min30;
      case 3600:
        return RemindTime.hour1;
      default:
        return RemindTime.none;
    }
  }
}
