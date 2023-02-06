import '../../../../common/model/appointment_model.dart';

class ResponseDomainModel {
  final String responseCode;
  final String responseDescription;
  final String fullName;
  final List<Appointment> appointment;
  ResponseDomainModel(
      {required this.responseCode,
      required this.responseDescription,
      required this.fullName,
      required this.appointment});
}
