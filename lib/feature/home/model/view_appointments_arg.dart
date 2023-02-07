import 'package:demo_api/common/model/appointment_model.dart';

class ViewAppointmentsArguments {
  final String responseCode;
  final String responseDescription;
  final String fullName;
  final List<Appointment> itemList;

  ViewAppointmentsArguments({
    required this.responseCode,
    required this.responseDescription,
    required this.fullName,
    required this.itemList,
  });
}
