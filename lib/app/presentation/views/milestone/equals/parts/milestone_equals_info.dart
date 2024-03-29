import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sisda/app/domain/models/milestone_model.dart';
import 'package:sisda/app/presentation/controllers/milestone/milestone_controller.dart';
import 'package:sisda/app/presentation/views/utils/app_launch.dart';

class MilestoneEqualsInfo extends StatelessWidget {
  final MilestoneController _milestoneController = Get.find();

  final MilestoneModel milestone;
  MilestoneEqualsInfo({Key? key, required this.milestone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // _milestoneController.edit(milestone.id!);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: milestone.user.profile?.photo != null
                      ? Image.network(
                          // 'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/0b28345ecb39e2177d1746f80246ed70_woman2.png',
                          milestone.user.profile!.photo!,
                          height: 40,
                          width: 40,
                          errorBuilder: (_, __, ___) {
                            return const Icon(
                              Icons.person,
                              color: Colors.black,
                            );
                          },
                        )
                      : const Align(
                          alignment: Alignment.center,
                          child: Text(
                            '🤪',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                ),
                title: Text(
                    '${milestone.user.profile?.nickname} | ${milestone.user.profile?.phone}'),
                subtitle: Text('${milestone.user.profile?.email}'),
              ),
              Text(milestone.id!),
              Text(milestone.name),
              Text('${milestone.utmx} | ${milestone.utmy}'),
              Text('${milestone.lat} | ${milestone.long}'),
              Text(
                  '${milestone.utmz} | ${milestone.utmfuso} | ${milestone.utmzone} | ${milestone.utmpole}'),
              IconButton(
                onPressed: () =>
                    AppLaunch.launchGoogleMaps(milestone.lat!, milestone.long!),
                icon: const Icon(Icons.location_on),
              )
            ],
          ),
        ),
      ),
    );
  }
}
