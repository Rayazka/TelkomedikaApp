import 'package:flutter/material.dart';

class ButtonTextLink extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonTextLink({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.03,
          color: const Color.fromARGB(255, 86, 113, 177),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
