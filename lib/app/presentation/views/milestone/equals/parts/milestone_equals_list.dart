import 'package:flutter/material.dart';
import 'package:sisda/app/domain/models/milestones_equals_model.dart';
import 'package:sisda/app/presentation/views/milestone/equals/parts/milestone_equals_calcs_info.dart';
import 'package:sisda/app/presentation/views/milestone/equals/parts/milestone_equals_info.dart';

class MilestoneEqualsList extends StatelessWidget {
  final List<MilestonesEqualsModel> milestones;
  const MilestoneEqualsList({
    Key? key,
    required this.milestones,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: milestones.length,
      itemBuilder: (context, index) {
        final milestone = milestones[index];
        return Card(
          color: Colors.grey,
          child: Column(
            children: [
              ...milestone.milestonesEquals
                  .map((e) => MilestoneEqualsInfo(milestone: e))
                  .toList(),
              ...milestone.milestonesEqualsCalcs
                  .map((e) => MilestoneEqualsCalcsInfo(calcs: e))
                  .toList(),
            ],
          ),
        );

        // return milestone.milestonesEquals
        //     .map((e) => MilestoneEqualsInfo(milestone: milestone))
        //     .toList();
        // return MilestoneEqualsInfo(milestone: milestone);
      },
    );
  }
}
