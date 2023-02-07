import 'package:flutter/cupertino.dart';

class Static {
  //Dummy Creds
  static const String url =
      'https://www.skylinecms.co.uk/alpha/RemoteEngineerAPI/GetAppointmentDetails';
  static const String userName = "Gary";
  static const String password = "123456789";

  // Settings View
  static const String settings = "Settings";
  static const String enterUrl = "Enter Url";
  static const String enterUserName = "Enter User Name";
  static const String enterPassword = "Enter Password";
  static const String save = "SAVE";

  // Home View
  static const String home = "Home";
  static const String refreshData = "Refresh Data";
  static const String viewAppoinments = "View Appointments";

  // View Appointments
  static const String nullBodyText =
      "Check the Settings & Refresh Data as there is no Data";

  // Custom Card
  static const String customerName = "Customer Name";
  static const String customerAddress = "Customer Address";
  static const String appointmentDetails = "Appointment Details";
  static const String companyName = "Company Name";
  static const String buidingName = "Building";
  static const String customerStreet = "Street";
  static const String addressArea = "Area";
  static const String addressTown = "Town";
  static const String county = "County";
  static const String chargeType = "Charge Type";
  static const String jobType = "Job Type";
  static const String call = "Call";
  static const String map = "Map";

  // DatePicker
  static const String date = "Date";
  static const String dateHeading = "Date :";

  // Data Layer
  static const String responseCodeOK = "SC0001";
  static const String responseCodeNoDATA = "SC0002";
}

//All Numeric and Double Static Values

class StaticVal {
  static const double size_1 = 1;
  static const double size_2 = 2;
  static const double size_3_5 = 3.5;
  static const double size_4 = 5;
  static const double size_5 = 5;
  static const double size_10 = 10;
  static const double size_15 = 15;
  static const double size_18 = 18;
  static const double size_25 = 25;
  static const double size_20 = 20;
  static const double size_50 = 50;
}

extension StringExtensions on String {
  String addColon() => "${this} : ";
  String giveGap() => "${this}  ";
  String giveComma() => "${this}, ";

  String trimSpace() {
    var x = this;
    if (x.contains(' ')) {
      x.replaceAll(' ', '');
      return x;
    }
    return this;
  }

  String returnNoDataVal({String? msg}) {
    var x = this;
    if ((x.contains(' ') && x.isNotEmpty) || x == '') {
      x = msg ?? '<No Data>';
      return x;
    }
    return this;
  }
}

extension DateTimeConversion on String {
  DateTime toNormalTimeFormat() {
    var x = this;
    var temp = x.split('/');
    return DateTime(int.parse(temp[2]), int.parse(temp[1]), int.parse(temp[0]));
  }
}
