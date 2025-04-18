import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telkomedika_app/app/modules/reservation/controllers/reservation_controller.dart';

class UpdateReservationDialog extends StatelessWidget {
  final String id;
  final String initialTanggal;
  final String initialJam;

  UpdateReservationDialog({
    super.key,
    required this.id,
    required this.initialTanggal,
    required this.initialJam,
  });

  final ReservationController controller = Get.find<ReservationController>();

  @override
  Widget build(BuildContext context) {
    final dateController = TextEditingController(text: initialTanggal);
    final timeController = TextEditingController(text: initialJam);

    return AlertDialog(
      title: Text("Ubah Jadwal"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: dateController,
            decoration: InputDecoration(labelText: "Tanggal"),
            readOnly: true,
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
              );
              if (picked != null) {
                dateController.text = picked.toIso8601String().split("T")[0];
              }
            },
          ),
          SizedBox(height: 10),
          TextField(
            controller: timeController,
            decoration: InputDecoration(labelText: "Jam"),
            readOnly: true,
            onTap: () async {
              final picked = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (picked != null) {
                timeController.text = picked.format(context);
              }
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text("Batal"),
        ),
        ElevatedButton(
          onPressed: () {
            controller.updateReservation(
              id: id,
              tanggal: dateController.text,
              jam: timeController.text,
            );
            Get.back();
          },
          child: Text("Simpan"),
        )
      ],
    );
  }
}
