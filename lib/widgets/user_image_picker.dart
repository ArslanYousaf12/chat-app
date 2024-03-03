import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TakeImage extends StatefulWidget {
  TakeImage({super.key, required this.imageContainer});
  void Function(File pickedimage) imageContainer;

  @override
  State<TakeImage> createState() => _TakeImageState();
}

class _TakeImageState extends State<TakeImage> {
  // File _pickedImage = File('');
  File? _pickedImage;

  void _imagePick() async {
    final imagepicker = ImagePicker();
    final XFile? image =
        await imagepicker.pickImage(source: ImageSource.camera);
    setState(() {
      _pickedImage = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          radius: 45,
          foregroundImage:
              _pickedImage != null ? FileImage(_pickedImage!) : null,
        ),
        const SizedBox(
          height: 5,
        ),
        TextButton.icon(
            onPressed: _imagePick,
            icon: const Icon(Icons.camera),
            label: const Text('Take Picture')),
      ],
    );
  }
}
