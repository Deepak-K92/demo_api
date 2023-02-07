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
  static const String nullBodyText = "Check the Settings as there is no Data";

  // Custom Card
  static const String customerName = "Customer Name";
  static const String customerAddress = "Customer Address";
  static const String appointmentDetails = "Appointment Details";

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
    if (x.contains(' ') && x.isNotEmpty) {
      x = msg ?? '<No Data>';
      return x;
    }
    return this;
  }
}
