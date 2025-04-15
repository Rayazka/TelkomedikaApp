import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.pinkAccent)),
                      SizedBox(height: 4),
                      Text("Azril Troy",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87)),
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.png"),
                    radius: 24,
                  ),
                ],
              ),
              SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
                label: Text("Reservasi",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: Size(double.infinity, 48),
                ),
              ),
              SizedBox(height: 32),
              Text(
                "Riwayat Konsultasi",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.indigo[900],
                ),
              ),
              SizedBox(height: 16),
              Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 1,
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Jadwal konsultasi",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[900])),
                            Icon(Icons.grid_view_rounded,
                                color: Colors.blue[800]),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Row(
                              children: [
                                Text("08:00",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.pink)),
                                SizedBox(width: 5),
                                Icon(Icons.arrow_right_alt, color: Colors.pink),
                                SizedBox(width: 5),
                                Text("09:00",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.pink)),
                              ],
                            ),
                            Text("Wed Jun 20",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.pink)),
                          ],
                        ),
                        const Divider(height: 25, thickness: 1),
                        Text(
                          'Poli Umum',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo[900],
                          ),
                        ),
                      ]))
            ],
          ),
        ),
      ),
    );
  }
}
