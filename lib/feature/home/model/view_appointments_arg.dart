import 'package:demo_api/common/model/appointment_model.dart';

class ViewAppointmentsArguments {
  final String responseCode;
  final String responseDescription;
  final String fullName;
  final List<Appointment> appointments;

  ViewAppointmentsArguments({
    required this.responseCode,
    required this.responseDescription,
    required this.fullName,
    required this.appointments,
  });

  toJson() => {
        'responseCode': responseCode,
        'responseDescription': responseDescription,
        'fullName': fullName,
        'itemList': List<dynamic>.from(appointments.map((x) => x.toJson()))
      };
}
