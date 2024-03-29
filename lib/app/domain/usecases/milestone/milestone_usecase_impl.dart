import 'package:get/get.dart';
import 'package:sisda/app/data/datasources/repositories/milestone_repository.dart';
import 'package:sisda/app/domain/models/milestone_model.dart';
import 'package:sisda/app/domain/usecases/milestone/milestone_usecase.dart';

class MilestoneUseCaseImpl implements MilestoneUseCase {
  final MilestoneRepository _repository;
  MilestoneUseCaseImpl({
    required MilestoneRepository repository,
  }) : _repository = repository;
  @override
  Future<void> create(MilestoneModel model) => _repository.create(model);

  @override
  Future<void> delete(String id) => _repository.delete(id);

  @override
  Future<void> list(RxList<MilestoneModel> list, bool myMilestones) =>
      _repository.list(list, myMilestones);

  @override
  Future<void> update(MilestoneModel courseModel) =>
      _repository.update(courseModel);

  // @override
  // Future<void> updateAddress(String productId, String addressId) =>
  //     _repository.updateAddress(productId, addressId);

  // @override
  // void subscribe(
  //         {required RxList<ProductEntity> list, Pagination? pagination}) =>
  //     _repository.subscribe(list: list, pagination: pagination);
}
