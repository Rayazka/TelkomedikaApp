import 'package:flutter/material.dart';
import 'package:telkomedika_app/app/modules/reservation/views/reservation_form_views.dart';

class AddReservationButton extends StatelessWidget {
  const AddReservationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReservationForm()),
        );
      },
      icon: Icon(Icons.add, size: 20, color: Colors.white),
      label: Text("Reservasi",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.035,
              color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pinkAccent,
        padding: EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: Size(double.infinity, 48),
      ),
    );
  }
}
