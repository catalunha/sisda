import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sisda/app/presentation/controllers/milestone/milestone_controller.dart';

class FileBytesButton extends StatefulWidget {
  final MilestoneController _milestoneController = Get.find();

  FileBytesButton({Key? key}) : super(key: key);

  @override
  State<FileBytesButton> createState() => _FileBytesButtonState();
}

class _FileBytesButtonState extends State<FileBytesButton> {
  String? path;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['ods'],
                allowMultiple: false);
            widget._milestoneController.loading = true;

            if (result != null && result.files.isNotEmpty) {
              String fileString;
              if (kIsWeb) {
                final fileBytes = result.files.first.bytes;
                widget._milestoneController.fileInBytes = fileBytes;
                fileString = String.fromCharCodes(fileBytes!);
              } else {
                File file = File(result.files.single.path!);
                final fileBytes = file.readAsBytesSync();
                widget._milestoneController.fileInBytes = fileBytes;
                fileString = String.fromCharCodes(fileBytes);
              }
              widget._milestoneController.fileString.value = fileString;
              path = result.files.first.name;
              setState(() {});
            } else {
              // User canceled the picker
            }
            widget._milestoneController.loading = false;
          },
          child: const Text('Selecione o arquivo'),
        ),
        path == null
            ? const Text('Sem arquivo.')
            : Text('Arquivo lido com sucesso: $path'),
      ],
    );
  }
}
