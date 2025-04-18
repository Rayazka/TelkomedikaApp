import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telkomedika_app/app/modules/home/views/home_page_views.dart';
import 'package:telkomedika_app/app/widgets/custom_alert_dialog.dart';

class ReservationController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Form controller
  final keluhanController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  final selectedDokter = 'Umum'.obs;
  final dokterList = ['Gigi', 'Umum'];

  // Stream untuk membaca data dari Firestore
  Stream<QuerySnapshot> get streamReservations {
    return _firestore
        .collection("reservations")
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  // Fungsi menyimpan reservasi baru
  Future<void> makeReservation() async {
    final dokter = selectedDokter.value;
    final tanggal = dateController.text;
    final jam = timeController.text;
    final keluhan = keluhanController.text;

    if (tanggal.isEmpty || jam.isEmpty || keluhan.isEmpty || dokter.isEmpty) {
      CustomAlertDialog.showError(
          title: "Form Tidak Lengkap",
          message: "Harap isi semua kolom terlebih dahulu");

      return;
    }

    try {
      await _firestore.collection("reservations").add({
        'dokter': dokter,
        'tanggal': tanggal,
        'jam': jam,
        'keluhan': keluhan,
        'createdAt': FieldValue.serverTimestamp(),
      });
      CustomAlertDialog.showSuccess(
        title: "Berhasil",
        message: "Reservasi berhasil disimpan!",
        onClose: () {
          Get.offAll(() => HomePage());
        },
      );
    } catch (e) {
      CustomAlertDialog.showError(
        title: "Gagal",
        message: "Terjadi kesalahan saat menyimpan reservasi: $e",
      );
    }
  }

  // Fungsi untuk memperbarui reservasi
  Future<void> updateReservation({
    required String id,
    required String tanggal,
    required String jam,
  }) async {
    if (tanggal.isEmpty || jam.isEmpty) {
      CustomAlertDialog.showError(
        title: "Form Tidak Lengkap",
        message: "Tanggal dan jam tidak boleh kosong!",
      );
      return;
    }

    try {
      await _firestore.collection("reservations").doc(id).update({
        'tanggal': tanggal,
        'jam': jam,
      });

      CustomAlertDialog.showSuccess(
        title: "Berhasil",
        message: "Jadwal berhasil diperbarui",
      );
      Get.back(); // tutup dialog
    } catch (e) {
      CustomAlertDialog.showError(
        title: "Gagal",
        message: "Gagal memperbarui jadwal: $e",
      );
    }
  }

  // Fungsi untuk menghapus reservasi
  Future<void> deleteReservation(String id) async {
    try {
      await _firestore.collection('reservations').doc(id).delete();
      CustomAlertDialog.showSuccess(
        title: "Dibatalkan",
        message: "Reservasi berhasil dibatalkan.",
      );
    } catch (e) {
      CustomAlertDialog.showError(
        title: "Gagal",
        message: "Gagal membatalkan reservasi: $e",
      );
    }
  }
}
