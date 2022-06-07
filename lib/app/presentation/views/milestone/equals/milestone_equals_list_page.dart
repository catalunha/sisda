import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sisda/app/presentation/controllers/milestone/milestone_controller.dart';
import 'package:sisda/app/presentation/views/milestone/equals/parts/milestone_equals_list.dart';
import 'package:sisda/app/presentation/views/utils/app_appbar.dart';

class MilestoneEqualsListPage extends StatelessWidget {
  final MilestoneController _milestoneController = Get.find();
  MilestoneEqualsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: const Text('Comparando marcos'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => MilestoneEqualsList(
                milestones: _milestoneController.milestoneEquals,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
