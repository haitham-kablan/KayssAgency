import 'dart:io';

import 'package:app/Design/ColorsPallete/NewClr.dart';
import 'package:app/Design/FontStyle/FontStyle.dart';
import 'package:app/Design/Widgets/roundImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;

class UserImage extends StatefulWidget {

  final Function(String imageUrl) onFileChanged;

  UserImage({
    required this.onFileChanged,
  });

  @override
  _UserImageState createState() => _UserImageState(onFileChanged);

  static File? getImage(){
    return _UserImageState._image;
  }
}

class _UserImageState extends State<UserImage> {

  final Function(String imageUrl) onFileChanged;
  final ImagePicker _picker = ImagePicker();
  static File? _image;
  String? imageUrl;

  _UserImageState(this.onFileChanged);

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          selectPhoto();
        },
        child: Container(
          // margin: EdgeInsets.only(right: 5),
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: bgClr,
            border: Border.all(width: 1,color:darkBlueClr ),
          ),
          child: _image == null ? Icon(Icons.account_circle_outlined , color: darkBlueClr) :
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.file(
              _image!,
              width: 70,
              height: 70,
              fit: BoxFit.fitHeight,
            ),
          )
        ),
      ),
    );
  }

  Future selectPhoto() async {
    await showModalBottomSheet(context: context, builder: (context) => BottomSheet(
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          color: bgClr,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(leading: Icon(Icons.camera,color: darkBlueClr,), title: simpleTxt("מצלמה", 18, darkBlueClr), onTap: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.camera);
              }),
              ListTile(leading: Icon(Icons.filter,color: darkBlueClr,), title: simpleTxt("גלריה", 18, darkBlueClr), onTap: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.gallery);
              }),
            ],
          ),
        ),
      ),
      onClosing: () {},
    ));
  }

  Future _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source, imageQuality: 100);
    if (pickedFile == null) {
      return;
    }

    var file = await ImageCropper.cropImage(sourcePath: pickedFile.path, aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1));
    if (file == null) {
      return;
    }

    file = await compressImagePath(file.path, 100);

    setState(() {
     _image = file;
    });

    onFileChanged("");
   // await _uploadFile(file.path);
  }

  Future<File> compressImagePath(String path, int quality) async {
    final newPath = p.join((await getTemporaryDirectory()).path, '${DateTime.now()}.${p.extension(path)}');

    final result = await FlutterImageCompress.compressAndGetFile(
      path,
      newPath,
      quality: quality,
    );

    return result!;
  }


}
