import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telkomedika_app/app/modules/reservation/controllers/reservation_controller.dart';
import 'package:telkomedika_app/app/widgets/reservationCard_widget.dart';

class ReservationList extends StatelessWidget {
  final int? maxItems; // null = semua

  const ReservationList({super.key, this.maxItems});

  @override
  Widget build(BuildContext context) {
    final ReservationController reservationController = Get.find();

    return StreamBuilder<QuerySnapshot>(
      stream: reservationController.streamReservations,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text(
              "😌 Belum ada konsultasi",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                color: Colors.grey,
              ),
            ),
          );
        }

        final reservations = snapshot.data!.docs;
        final limitedReservations = maxItems != null
            ? reservations.take(maxItems!).toList()
            : reservations;

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: limitedReservations.length,
          itemBuilder: (context, index) {
            final doc = limitedReservations[index];
            final data = doc.data() as Map<String, dynamic>;

            return ReservationCard(
              id: doc.id,
              dokter: data['dokter'] ?? '-',
              tanggal: data['tanggal'] ?? '-',
              jam: data['jam'] ?? '-',
              keluhan: data['keluhan'] ?? '-',
            );
          },
        );
      },
    );
  }
}
