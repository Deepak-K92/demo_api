import '../../data_layer/data_models/service_parameter_data_model.dart';
import '../../data_layer/data_sources/post_xml_data_source.dart';
import '../../domain_layer/mapper/data_to_domain_mapper.dart';
import '../domain_model/response_domain_model.dart';
import '../domain_model/service_parameters_domain_model.dart';

abstract class PostDataRepository {
  Future getData(ServiceParameterDomainModel domainModel) async {}
}

class PostDataRepositoryImpl implements PostDataRepository {
  final PostDataDataSource postDataDataSource;
  PostDataRepositoryImpl({required this.postDataDataSource});

  @override
  Future<ResponseDomainModel> getData(
      ServiceParameterDomainModel domainModel) async {
    final data = await postDataDataSource.getDataFromSource(
      ServiceParameterDataModel(
        url: domainModel.url,
        userName: domainModel.userName,
        currentDate: domainModel.currentDate,
        password: domainModel.password,
      ),
    );
    return DataToDomainMapper(dataModel: data).changeToDomain();
  }
}
