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
}

extension mapper on ResponseDomainModel {
  ResponseViewModel mapToViewModel() {
    return ResponseViewModel(
      responseCode: this.responseCode,
      responseDescription: this.responseDescription,
      fullName: this.fullName,
      appointment: this.appointment,
    );
  }
}
