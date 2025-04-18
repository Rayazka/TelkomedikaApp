import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telkomedika_app/app/modules/home/views/controllers/home_controller.dart';
import 'package:telkomedika_app/app/modules/profile/views/profile_view.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<HomeController>();
    final screenWidth = MediaQuery.of(context).size.width;

    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Nama user
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: screenWidth * 0.065,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  userController.name.value.isNotEmpty
                      ? userController.name.value
                      : 'User',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w600,
                    color: Colors.indigo[900],
                  ),
                ),
              ],
            ),

            // Foto profil
            GestureDetector(
              onTap: () {
                Get.to(() => ProfilePage());
              },
              child: CircleAvatar(
                radius: screenWidth * 0.07,
                backgroundImage: userController.photoUrl.value.isNotEmpty
                    ? (userController.photoUrl.value.startsWith('http')
                        ? NetworkImage(userController.photoUrl.value)
                        : AssetImage(userController.photoUrl.value)
                            as ImageProvider)
                    : const AssetImage('assets/images/users.png'),
              ),
            ),
          ],
        ));
  }
}
