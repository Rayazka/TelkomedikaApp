import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:telkomedika_app/app/modules/reservation/controllers/reservation_controller.dart';
import 'package:telkomedika_app/app/modules/home/views/home_page_views.dart';
import 'package:telkomedika_app/app/widgets/titleBar_widget.dart';
import 'package:telkomedika_app/app/widgets/button_widget.dart';

class ReservationForm extends StatelessWidget {
  ReservationForm({super.key});

  final ReservationController controller = Get.put(ReservationController());

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.dateController.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final now = DateTime.now();
      final dt =
          DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
      controller.timeController.text = DateFormat.Hm().format(dt);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              TitleBar(
                title: "Reservasi",
                onBack: () {
                  Get.offAll(() => HomePage());
                },
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Pilih Dokter",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Obx(() => Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: controller.selectedDokter.value,
                      underline: const SizedBox(),
                      onChanged: (String? newValue) {
                        controller.selectedDokter.value = newValue!;
                      },
                      items: controller.dokterList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  _selectDate(context);
                },
                child: AbsorbPointer(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      controller: controller.dateController,
                      decoration: InputDecoration(
                        labelText: "Tanggal",
                        suffixIcon: const Icon(Icons.calendar_today_outlined,
                            color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.redAccent),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () => _selectTime(context),
                child: AbsorbPointer(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      controller: controller.timeController,
                      decoration: InputDecoration(
                        labelText: 'Pilih Jam',
                        suffixIcon:
                            const Icon(Icons.access_time, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  controller: controller.keluhanController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Keluhan',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: max(MediaQuery.of(context).size.width * 0.9, 100),
                child: ButtonWidget(
                  text: 'Reservasi',
                  onPressed: controller.makeReservation,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
