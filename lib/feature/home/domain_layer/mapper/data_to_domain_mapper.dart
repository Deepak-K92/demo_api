import '../../data_layer/data_models/response_data_model.dart';
import '../../domain_layer/domain_model/response_domain_model.dart';

class DataToDomainMapper {
  final ResponseDataModel dataModel;
  DataToDomainMapper({required this.dataModel});

  ResponseDomainModel changeToDomain(){

    return ResponseDomainModel(
        responseCode: dataModel.responseCode,
        responseDescription: dataModel.responseDescription,
        fullName: dataModel.fullName,
        appointment: dataModel.appointment
    );
  }
}