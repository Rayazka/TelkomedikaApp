import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telkomedika_app/app/modules/reservation/controllers/reservation_controller.dart';
import 'package:telkomedika_app/app/widgets/custom_alert_dialog.dart';
import 'package:telkomedika_app/app/widgets/update_reserved_dialog_widget.dart';

class ReservationCard extends StatelessWidget {
  final String id;
  final String dokter;
  final String tanggal;
  final String jam;
  final String keluhan;

  const ReservationCard({
    Key? key,
    required this.id,
    required this.dokter,
    required this.tanggal,
    required this.jam,
    required this.keluhan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(205, 158, 158, 158),
            blurRadius: 10,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dokter,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(jam,
                  style: TextStyle(
                      fontSize: screenWidth * 0.035, color: Colors.pink)),
              Text(tanggal,
                  style: TextStyle(
                      fontSize: screenWidth * 0.03, color: Colors.pink)),
            ],
          ),
          const Divider(height: 25, thickness: 1),
          Text(
            keluhan,
            style: TextStyle(
              fontSize: screenWidth * 0.03,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Tombol "Ubah Jadwal"
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.dialog(UpdateReservationDialog(
                      id: id,
                      initialTanggal: tanggal,
                      initialJam: jam,
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[700],
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Ubah Jadwal",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.025,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              // Tombol "Batalkan Jadwal"
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    CustomAlertDialog.showConfirmation(
                        title: "Konfirmasi",
                        message: "Yakin ingin membatalkan jadwal ini?",
                        onConfirm: () => Get.find<ReservationController>()
                            .deleteReservation(id));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Batalkan Jadwal",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.025,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
