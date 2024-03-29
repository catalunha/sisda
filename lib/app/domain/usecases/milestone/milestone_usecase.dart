import 'package:get/get.dart';
import 'package:sisda/app/domain/models/milestone_model.dart';

abstract class MilestoneUseCase {
  Future<void> create(MilestoneModel model);
  Future<void> list(RxList<MilestoneModel> list, bool myMilestones);
  Future<void> update(MilestoneModel model);
  Future<void> delete(String id);
}
