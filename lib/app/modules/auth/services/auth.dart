import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:telkomedika_app/app/modules/auth/views/login_page_views.dart';
import 'package:telkomedika_app/app/widgets/custom_alert_dialog.dart';

class AuthController {
  final User? firebaseUser = FirebaseAuth.instance.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential?> login(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      return null;
    }
  }

  Future<UserCredential?> register(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      return null;
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      Get.offAll(() => LoginPage());
    } catch (e) {
      CustomAlertDialog.showError(
        title: "Logout Gagal",
        message: "Terjadi kesalahan saat logout: $e",
      );
    }
  }

  // Google Sign In
  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      CustomAlertDialog.showError(
        title: "Google Sign-In Error",
        message: "Terjadi kesalahan saat masuk dengan Google: $e",
      );
      return null;
    }
  }
}
