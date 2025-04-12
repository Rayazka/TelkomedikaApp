import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;

  const InputField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.obscureText,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 15, left: 30),
              child: Text(
                label,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.90,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 16),
                child: TextField(
                  obscureText: obscureText,
                  controller: controller,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    hintText: hintText,
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF737473),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(color: Color(0xFF737473)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(color: Color(0xFF737473)),
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
