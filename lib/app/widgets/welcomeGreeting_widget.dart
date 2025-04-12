import 'package:flutter/material.dart';

class WelcomeGreeting extends StatelessWidget {
  final String greeting;

  const WelcomeGreeting({super.key, required this.greeting});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 34, left: 30),
              child: Text(
                greeting,
                style: TextStyle(
                  color: Color.fromARGB(255, 244, 31, 38),
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.only(top: 16, left: 30),
              child: Text(
                "TelkoMedika merupakan perusahaan penyedia layanan kesehatan (Healthcare Provider) yang memberikan layanan solusi kesehatan untuk masyarakat umum berupa Klinik, Laboratorium, Apotek, Optik dan Layanan Kesehatan.",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.025,
                    fontWeight: FontWeight.w200),
                softWrap: true,
                overflow: TextOverflow.visible,
              ),
            )
          ],
        ),
      ],
    );
  }
}
