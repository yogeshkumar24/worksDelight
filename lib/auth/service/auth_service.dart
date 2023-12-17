import 'package:firebase_auth/firebase_auth.dart';
import 'package:work_delight_task/utils/app_constant.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> signIn(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      AppConstant.showToast(e.toString());
      print(e.toString());
      return null;
    }
  }



  Future<UserCredential?> signUp(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      AppConstant.showToast(e.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
