import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isFullWidth;
  final bool isLoading;

  const ButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.isFullWidth = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isLoading ? null : onPressed, // Disable saat loading
      style: TextButton.styleFrom(
        minimumSize: isFullWidth ? const Size.fromHeight(51) : null,
        backgroundColor: Color(0xFFED1C24),
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(200 / 2),
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                ),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
