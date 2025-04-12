import 'package:flutter/material.dart';

class ButtonSignInWithGoogle extends StatelessWidget {
  final VoidCallback onGoogleTap;
  ButtonSignInWithGoogle({
    super.key,
    required this.onGoogleTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Text(
          "or sign in with",
          style: TextStyle(
            color: Colors.black,
            fontSize: MediaQuery.of(context).size.width * 0.03,
            fontWeight: FontWeight.w200,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.1,
          height: MediaQuery.of(context).size.width * 0.1,
          child: ElevatedButton(
            onPressed: onGoogleTap,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              backgroundColor: const Color.fromARGB(255, 220, 230, 255),
              elevation: 2,
            ),
            child: Image.asset(
              'assets/images/Google.png',
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width * 0.05,
            ),
          ),
        )
      ],
    );
  }
}
