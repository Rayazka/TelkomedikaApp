import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telkomedika_app/app/modules/auth/views/login_page_views.dart';
import 'package:telkomedika_app/app/modules/home/views/home_page_views.dart';
import 'package:telkomedika_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:telkomedika_app/app/widgets/titleBar_widget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TitleBar(
                  title: "Profile",
                  onBack: () => Get.offAll(() => HomePage()),
                ),
                const SizedBox(height: 30),

                // Foto Profil
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.12,
                  backgroundImage: controller.photoUrl.value.isNotEmpty
                      ? (controller.photoUrl.value.startsWith('http')
                          ? NetworkImage(controller.photoUrl.value)
                          : AssetImage(controller.photoUrl.value)
                              as ImageProvider)
                      : const AssetImage('assets/images/users.png'),
                ),
                const SizedBox(height: 12),

                // Username
                Text(
                  controller.name.value.isNotEmpty
                      ? controller.name.value
                      : 'Memuat...',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),

                ElevatedButton(
                  onPressed: controller.pickAndUploadPhoto,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                  ),
                  child: Text(
                    "Edit Foto Profil",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListTile(
                    leading: const Icon(Icons.logout, color: Colors.redAccent),
                    title: Text("Keluar",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        )),
                    trailing:
                        const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                    onTap: () {
                      controller.logout();
                      Get.offAll(() => LoginPage());
                    },
                  ),
                ),
                const Divider(),
              ],
            ),
          )),
    );
  }
}
