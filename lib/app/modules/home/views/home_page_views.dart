import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telkomedika_app/app/modules/home/views/controllers/home_controller.dart';
import 'package:telkomedika_app/app/modules/reservation/controllers/reservation_controller.dart';
import 'package:telkomedika_app/app/modules/reservation/views/riwayat_views.dart';
import 'package:telkomedika_app/app/widgets/add_reservation_button_widget.dart';
import 'package:telkomedika_app/app/widgets/home_header_widget.dart';
import 'package:telkomedika_app/app/widgets/page_widget.dart';
import 'package:telkomedika_app/app/widgets/reservation_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ReservationController reservationController =
      Get.put(ReservationController());

  final HomeController userController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    userController.fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            HomeHeader(),
            SizedBox(height: 24),
            AddReservationButton(),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Riwayat Konsultasi",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.w600,
                    color: Colors.indigo[900],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RiwayatPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Lihat Semua",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.025,
                      color: Colors.indigo,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            const ReservationList(maxItems: 3),
          ],
        ),
      ),
    );
  }
}
