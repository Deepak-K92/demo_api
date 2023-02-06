import '../../domain_layer/repository/post_data_repository.dart';
import '../domain_model/response_domain_model.dart';
import '../domain_model/service_parameters_domain_model.dart';

abstract class PostDataUseCase {
  Future getData(ServiceParameterDomainModel domainModel) async {}
}

class PostDataUseCaseImpl implements PostDataUseCase {
  final PostDataRepository postDataRepository;
  PostDataUseCaseImpl({required this.postDataRepository});
  @override
  Future<ResponseDomainModel> getData(
      ServiceParameterDomainModel domainModel) async {
    final data = await postDataRepository.getData(domainModel);
    return data;
  }
}
