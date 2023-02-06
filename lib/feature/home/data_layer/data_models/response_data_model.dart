import '../../../../common/model/appointment_model.dart';

class ResponseDataModel {
  final String responseCode;
  final String responseDescription;
  final String fullName;
  final List<Appointment> appointment;
  ResponseDataModel(
      {required this.responseCode,
      required this.responseDescription,
      required this.fullName,
      required this.appointment});
}
