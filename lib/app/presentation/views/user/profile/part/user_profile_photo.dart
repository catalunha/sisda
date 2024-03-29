import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sisda/app/presentation/controllers/user/profile/user_profile_controller.dart';

class UserProfilePhoto extends StatefulWidget {
  final UserProfileController _userProfileController = Get.find();

  UserProfilePhoto({Key? key}) : super(key: key);

  @override
  State<UserProfilePhoto> createState() => _UserProfilePhotoState();
}

class _UserProfilePhotoState extends State<UserProfilePhoto> {
  final ImagePicker _picker = ImagePicker();
  XFile? _xfile;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: _xfile != null
          ? Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: kIsWeb
                  ? Image.network(
                      _xfile!.path,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        print('error 1');
                        return errorBuilderWidget();
                      },
                    )
                  : Image.file(
                      File(_xfile!.path),
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        print('error 2');
                        return errorBuilderWidget();
                      },
                    ),
            )
          : widget._userProfileController.userProfile?.photo == null
              ? Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Click aqui para buscar uma imagem',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    widget._userProfileController.userProfile!.photo!,
                    // loadingBuilder: (_, __, ___) {
                    //   return const Center(
                    //       child: CircularProgressIndicator());
                    // },
                    height: 100,
                    width: 100,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      print('error 3');
                      return errorBuilderWidget();
                    },
                  ),
                ),
      onTap: () async {
        print('aqui...');
        final XFile? pickedFile =
            await _picker.pickImage(source: ImageSource.gallery);

        if (pickedFile != null) {
          widget._userProfileController.xfile = pickedFile;
          setState(() {
            _xfile = pickedFile;
          });
        }
      },
    );
  }

  Container errorBuilderWidget() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Center(
        child: Text('Erro ao buscar esta imagem'),
      ),
    );
  }
}
