import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAlertDialog {
  /// ✅ Untuk dialog sukses
  static void showSuccess({
    required String title,
    required String message,
    VoidCallback? onClose,
  }) {
    Get.dialog(
      _buildDialog(
        icon: Icons.check_circle,
        iconColor: Colors.green,
        title: title,
        message: message,
        buttonText: "Kembali",
        buttonColor: Colors.green,
        onPressed: onClose,
      ),
      barrierDismissible: false,
    );
  }

  /// ❌ Untuk dialog error
  static void showError({
    required String title,
    required String message,
    VoidCallback? onClose,
  }) {
    Get.dialog(
      _buildDialog(
        icon: Icons.cancel,
        iconColor: Colors.red,
        title: title,
        message: message,
        buttonText: "Tutup",
        buttonColor: Colors.red,
        onPressed: onClose,
      ),
      barrierDismissible: false,
    );
  }

  /// ❓ Untuk konfirmasi aksi
  static void showConfirmation({
    required String title,
    required String message,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
  }) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.white,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = MediaQuery.of(context).size.width;
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.help_outline, size: 64, color: Colors.amber[800]),
                  const SizedBox(height: 20),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.amber[800],
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                            if (onCancel != null) onCancel();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                                color: Color(0xFFFF8F00), width: 2),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Batal",
                            style: TextStyle(
                                fontSize: screenWidth * 0.03,
                                color: Color(0xFFFF8F00)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                            onConfirm();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF8F00),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Lanjutkan",
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
      barrierDismissible: false,
    );
  }

  /// 🔧 Template dasar untuk success & error
  static Widget _buildDialog({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String message,
    required String buttonText,
    required Color buttonColor,
    VoidCallback? onPressed,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: Colors.white,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 64, color: iconColor),
                const SizedBox(height: 20),
                Text(
                  title,
                  style: TextStyle(
                    color: iconColor,
                    fontSize: screenWidth * 0.05, // Responsif
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.03, // Responsif
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                      if (onPressed != null) onPressed();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      buttonText,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04, // Responsif
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
