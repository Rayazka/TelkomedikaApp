import 'package:flutter/material.dart';
import 'signup_page_views.dart';
import 'landing_page_views.dart';

void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                LogIn(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 390,
          height: 815,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 15,
                top: 37,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LandingPage()),
                    );
                  },
                  child: Image.asset(
                    'assets/images/Vector.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Positioned(
                left: 119,
                top: 50,
                child: SizedBox(
                  width: 121,
                  height: 30,
                  child: Text(
                    'Log In',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFED1C24),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 111,
                child: SizedBox(
                  width: 121,
                  height: 30,
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      color: const Color(0xFFED1C24),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 208,
                child: SizedBox(
                  width: 214,
                  height: 30,
                  child: Text(
                    'Email Account',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 234,
                child: SizedBox(
                  width: 299,
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      hintText: 'example@example.com',
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF737473),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: BorderSide(
                          color: Color(0xFF737473),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: BorderSide(
                          color: Color(0xFF737473),
                        ),
                      ),
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 325,
                child: SizedBox(
                  width: 299,
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      hintText: '**********',
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF737473),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: BorderSide(
                          color: Color(0xFF8F9BB3),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: BorderSide(
                          color: Color(0xFF8F9BB3),
                        ),
                      ),
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Positioned(
                left: 137,
                top: 379,
                child: SizedBox(
                  width: 185,
                  height: 30,
                  child: Text(
                    'Forget Password',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: const Color(0xFFED1C24),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 141,
                child: SizedBox(
                  width: 324,
                  height: 30,
                  child: Text(
                    'TelkoMedika merupakan perusahaan penyedia layanan kesehatan (Healthcare Provider) yang memberikan layanan solusi kesehatan untuk masyarakat umum berupa Klinik, Laboratorium, Apotek, Optik dan Layanan Kesehatan.',
                    style: TextStyle(
                      color: const Color(0xFF070707),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 82,
                top: 442,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupPage()),
                    );
                  },
                  child: Container(
                    width: 207,
                    height: 45,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFED1C24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Log In',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 49,
                top: 487,
                child: SizedBox(
                  width: 273,
                  height: 20,
                  child: Text(
                    'or sign in with',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF070707),
                      fontSize: 12,
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 181,
                top: 517,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFCAD6FF),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 192,
                top: 528,
                child: GestureDetector(
                  onTap: () {
                    print('Google Sign-In tapped');
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Google.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
