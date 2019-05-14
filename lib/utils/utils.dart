import 'package:flutter_social/ui/login/models/app_front/data.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  String _token;
  Data _data;

  void setApiToken(String token) {
    this._token = token;
  }

  String getApiToken() {
    return this._token;
  }

  void setData(Data data) {
    _data = data;
  }

  Data getData() {
    return _data;
  }
}

final preferences = Utils();

void showToast(String msg, Color backgroundColor, Color textColor) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0);
}

DateTime parseStringDate(String birthday) {
  var format = DateFormat('yyyy-MM-dd');

  return format.parse(birthday);

}

int getYear(DateTime date) {
  var _date = date;

  return _date.year;
}

int getDay(DateTime date) {
  var _date = date;

  return _date.day;
}

String getMonth(DateTime date) {
  var _date = date;

  String month;

  switch (_date.month) {
    case 1: {
      month = 'January';
      break;
    }
    case 2: {
      month = 'February';
      break;
    }
    case 3: {
      month = 'March';
      break;
    }
    case 4: {
      month = 'April';
      break;
    }
    case 5: {
      month = 'May';
      break;
    }
    case 6: {
      month = 'June';
      break;
    }
    case 7: {
      month = 'July';
      break;
    }
    case 8: {
      month = 'August';
      break;
    }
    case 9: {
      month = 'September';
      break;
    }
    case 10: {
      month = 'October';
      break;
    }
    case 11: {
      month = 'November';
      break;
    }
    case 12: {
      month = 'December';
      break;
    }
  }

  return month;
}

String getWeekDay(DateTime date) {
  var _date = date;

  String weekDay;

  switch (_date.weekday) {
    case 0: {
      weekDay = 'Sunday';
      break;
    }
    case 1: {
      weekDay = 'Monday';
      break;
    }
    case 2: {
      weekDay = 'Tuesday';
      break;
    }
    case 3: {
      weekDay = 'Wednesday';
      break;
    }
    case 4: {
      weekDay = 'Thursday';
      break;
    }
    case 5: {
      weekDay = 'Friday';
      break;
    }
    case 6: {
      weekDay = 'Saturday';
      break;
    }
  }

  return weekDay;
}

int calculateAge(DateTime birthday) {

  var _birthday = birthday;
  var _currentDate = DateTime.now();

  int age;

  age = _currentDate.year - _birthday.year;

  if (_currentDate.month < _birthday.month) {
    age = (_currentDate.year - _birthday.year) - 1;
  } else if (_currentDate.month == _birthday.month &&
      _currentDate.day < _birthday.day) {
    age = (_currentDate.year - _birthday.year) - 1;
  }

  return age;
}
