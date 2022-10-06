extension DateTimeExtensions on DateTime {
  String toCustomDateFormat() {
    var date = this;
    var month = '';
    switch (date.month) {
      case 1:
        month = 'Januari';
        break;
      case 2:
        month = 'Februari';
        break;
      case 3:
        month = 'Maret';
        break;
      case 4:
        month = 'April';
        break;
      case 5:
        month = 'Mei';
        break;
      case 6:
        month = 'Juni';
        break;
      case 7:
        month = 'Juli';
        break;
      case 8:
        month = 'Agustus';
        break;
      case 9:
        month = 'September';
        break;
      case 10:
        month = 'Oktober';
        break;
      case 11:
        month = 'November';
        break;
      case 12:
        month = 'Desember';
        break;
      default:
        month = 'undefined';
        break;
    }

    var day = '';
    switch (date.weekday) {
      case 1:
        day = 'Senin';
        break;
      case 2:
        day = 'Selasa';
        break;
      case 3:
        day = 'Rabu';
        break;
      case 4:
        day = 'Kamis';
        break;
      case 5:
        day = 'Jum\'at';
        break;
      case 6:
        day = 'Sabtu';
        break;
      case 7:
        day = 'Minggu';
        break;
    }
    return '$day, ${date.day} $month ${date.year}';
  }
}
