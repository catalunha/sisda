import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sisda/app/presentation/controllers/milestone/milestone_controller.dart';
import 'package:sisda/app/presentation/views/milestone/others/parts/milestone_others_list.dart';
import 'package:sisda/app/presentation/views/utils/app_appbar.dart';

class MilestoneOthersListPage extends StatelessWidget {
  final MilestoneController _milestoneController = Get.find();
  MilestoneOthersListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: const Text('Marcos dos colegas'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.search),
            trailing: Obx(
                () => Text('${_milestoneController.milestoneSearch.length}')),
            title: TextField(
              decoration: const InputDecoration(
                labelText: 'Digite o nome de um marco',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                _milestoneController.onMilestoneSearch(value, false);
              },
            ),
          ),
          Expanded(
            child: Obx(() => _milestoneController.milestoneSearch.isNotEmpty
                ? Card(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: SizedBox(
                        height: 200,
                        child: MilestoneOthersList(
                          milestones: _milestoneController.milestoneSearch,
                        ),
                      ),
                    ),
                  )
                : MilestoneOthersList(
                    milestones: _milestoneController.milestonesOthers,
                  )),
          ),
        ],
      ),
    );
  }
}
