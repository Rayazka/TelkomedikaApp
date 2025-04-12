import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;

  const TitleBar({Key? key, required this.title, this.onBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onBack ?? () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: Image.asset(
              'assets/images/Vector.png',
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width * 0.03,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 20),
            child: Text(
              title,
              style: TextStyle(
                color: const Color.fromARGB(255, 244, 31, 38),
                fontSize: MediaQuery.of(context).size.width * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
