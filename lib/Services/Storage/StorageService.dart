

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;




class FireBaseStorage{
  static FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  static Future<String> uploadProfilePicture(String path,String email) async {
    final ref = firebaseStorage.ref()
        .child('profile').child(email + "/" +p.basename(path));
    final TaskSnapshot result = await ref.putFile(File(path));
    return await result.ref.getDownloadURL();
  }
}
