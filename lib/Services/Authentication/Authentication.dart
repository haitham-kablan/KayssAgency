

import 'package:app/Providers/AuthProvider.dart';
import 'package:app/Services/ColudFireStore/CloudFireStore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService{


  static Future<String?> Login(String email,String password) async{

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return  "דואל זה אינו קיים במערכת";
      } else if (e.code == 'wrong-password') {
        return "הסיסמה לא תואמת לדואל";
      }
    } catch (e) {
      return "אין חיבור לאנטרניט";
    }

  }

  static Future Logout(currentUserProvider provider) async{
    provider.setInit(false);
    await FirebaseAuth.instance.signOut();
  }

  static Future<String?> Reigester(String email,String password,String userName) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return "הסיסמה חייבת להיות לפחות 6 תווים";
      } else if (e.code == 'email-already-in-use') {
        return "דואל זה כבר קיים במערכת";
      }
    } catch (e) {
      return "אין חיבור לאנטרניט";
    }

  }


  static Future getCurrentUser(currentUserProvider provider) async {

    if(FirebaseAuth.instance.currentUser == null){
      provider.setInit(false);
    }else{
      if(provider.init){
        return;
      }
      CloudFireStore.getUser(provider, FirebaseAuth.instance.currentUser!.email!);
    }
  }


}