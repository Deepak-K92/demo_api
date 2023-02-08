import '../../../common/model/appointment_model.dart';
import '../domain_layer/domain_model/response_domain_model.dart';

class ResponseViewModel {
  final String responseCode;
  final String responseDescription;
  final String fullName;
  final List<Appointment> appointment;

  ResponseViewModel(
      {required this.responseCode,
      required this.responseDescription,
      required this.fullName,
      required this.appointment});

  factory ResponseViewModel.fromJson(Map<String, dynamic> json) =>
      ResponseViewModel(
        responseCode: json['responseCode'],
        responseDescription: json['responseDescription'],
        fullName: json['fullName'],
        appointment: List<Appointment>.from(
            json["appointment"].map((x) => Appointment.fromJson(x))),
      );

  toJson() => {
        'responseCode': responseCode,
        'responseDescription': responseDescription,
        'fullName': fullName,
        'appointment': List<dynamic>.from(appointment.map((x) => x.toJson())),
      };
}

extension Mapper on ResponseDomainModel {
  ResponseViewModel mapToViewModel() {
    return ResponseViewModel(
      responseCode: this.responseCode,
      responseDescription: this.responseDescription,
      fullName: this.fullName,
      appointment: this.appointment,
    );
  }
}
