import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telkomedika_app/app/modules/home/views/home_page_views.dart';
import 'package:telkomedika_app/app/modules/reservation/controllers/reservation_controller.dart';
import 'package:telkomedika_app/app/widgets/reservationCard_widget.dart';
import 'package:telkomedika_app/app/widgets/reservation_list_widget.dart';
import 'package:telkomedika_app/app/widgets/titleBar_widget.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  final ReservationController reservationController =
      Get.put(ReservationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TitleBar(
                title: "Riwayat Reservasi",
                onBack: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => HomePage()),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: ReservationList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
