import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telkomedika_app/app/widgets/customAlertDialog.dart';

class ProfileController extends GetxController {
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

  Future<void> pickAndUploadPhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    final uid = user?.uid;
    if (uid == null) return;

    final file = File(pickedFile.path);
    final storageRef =
        FirebaseStorage.instance.ref().child('profile_photos/$uid.jpg');

    try {
      await storageRef.putFile(file);
      final downloadUrl = await storageRef.getDownloadURL();

      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'photoUrl': downloadUrl,
      });

      photoUrl.value = downloadUrl;

      CustomAlertDialog.showSuccess(
        title: "Berhasil",
        message: "Foto profil berhasil diperbarui",
      );
    } catch (e) {
      CustomAlertDialog.showError(
        title: "Maaf, Gagal",
        message: "Fitur gimmick, kalau mau upload harus bayar le...",
      );
    }
  }

  void logout() {
    FirebaseAuth.instance.signOut();
  }
}
