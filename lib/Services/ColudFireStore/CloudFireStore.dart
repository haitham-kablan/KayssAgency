

import 'package:app/Providers/AuthProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFireStore{

  static FirebaseFirestore cloudStore = FirebaseFirestore.instance;
  static String usersCollection = "USERS";

  static Future addUserToDb(Map<String,dynamic> map)async{
    await cloudStore.collection(usersCollection).doc(map["email"]).set(map);
  }

  static Future updateUserFeild(Map<String,dynamic> map,String email)async{
    await cloudStore.collection(usersCollection).doc(email).update(map);
  }

  static Future getUser(currentUserProvider provider,String email)async{


    DocumentSnapshot documentSnapshot = await cloudStore.collection(usersCollection).doc(email).get();
    Map<String,dynamic> map = documentSnapshot.data() as Map<String,dynamic>;

    provider.setEmail(map["email"]);
    provider.setName(map["name"]);
    provider.setPhone(map["phoneNumber"]);
    provider.setInit(true);
    provider.setPoints(map["pts"]);
    provider.setImage(map["image"]);
  }

}