abstract class AppDateUtils {
  static String formatDate(DateTime date) {
    String dayOfWeek = '';
    switch (date.weekday) {
      case 1:
        dayOfWeek = 'Понедельник';
        break;
      case 2:
        dayOfWeek = 'Вторник';
        break;
      case 3:
        dayOfWeek = 'Среда';
        break;
      case 4:
        dayOfWeek = 'Четверг';
        break;
      case 5:
        dayOfWeek = 'Пятница';
        break;
      case 6:
        dayOfWeek = 'Суббота';
        break;
      case 7:
        dayOfWeek = 'Воскресенье';
        break;
    }

    String month = '';
    switch (date.month) {
      case 1:
        month = 'января';
        break;
      case 2:
        month = 'февраля';
        break;
      case 3:
        month = 'марта';
        break;
      case 4:
        month = 'апреля';
        break;
      case 5:
        month = 'мая';
        break;
      case 6:
        month = 'июня';
        break;
      case 7:
        month = 'июля';
        break;
      case 8:
        month = 'августа';
        break;
      case 9:
        month = 'сентября';
        break;
      case 10:
        month = 'октября';
        break;
      case 11:
        month = 'ноября';
        break;
      case 12:
        month = 'декабря';
        break;
    }

    return '$dayOfWeek, ${date.day} $month ${date.year} г.';
  }

  static String toHHMM(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  static String getMonthString(DateTime dateTime) {
    String month = '';
    switch (dateTime.month) {
      case 1:
        month = 'январь';
        break;
      case 2:
        month = 'февраль';
        break;
      case 3:
        month = 'март';
        break;
      case 4:
        month = 'апрель';
        break;
      case 5:
        month = 'май';
        break;
      case 6:
        month = 'июнь';
        break;
      case 7:
        month = 'июль';
        break;
      case 8:
        month = 'август';
        break;
      case 9:
        month = 'сентябрь';
        break;
      case 10:
        month = 'октябрь';
        break;
      case 11:
        month = 'ноябрь';
        break;
      case 12:
        month = 'декабрь';
        break;
    }
    return month;
  }
}
