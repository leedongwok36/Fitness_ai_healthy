import 'package:flutter/material.dart';

class LoginWidgets {
  static Widget socialButton(
    BuildContext context, {
    String? imagePath,
    IconData? icon,
    Color? iconColor,
    required double screenWidth,
    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    double btnWidth = (screenWidth > 600) ? 120 : (screenWidth - 90) / 3;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
      width: btnWidth,
      height: 55,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: isDark ? null : [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))
        ],
      ),

      child: Center(
        child: imagePath != null 
          ? Image.asset(
              imagePath, 
              width: 24, 
              height: 24, 
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
            )
          : Icon(icon, color: iconColor, size: 28),
      ),
     ),
    );
  }

  static Widget inputField(BuildContext context, IconData icon, String hint, {bool isPassword = false}) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextField(
        obscureText: isPassword,
        style: TextStyle(color: theme.brightness == Brightness.dark ? Colors.white : Colors.black),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          prefixIcon: Icon(icon, color: Colors.grey, size: 22),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }
}