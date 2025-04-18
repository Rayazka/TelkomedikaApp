import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final user = FirebaseAuth.instance.currentUser;
  var name = ''.obs;
  var photoUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final uid = user?.uid;
    if (uid == null) return;

    final doc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (doc.exists) {
      final data = doc.data();
      name.value = data?['name'] ?? 'Pengguna';
      photoUrl.value = data?['photoUrl'] ?? '';
    }
  }
}
