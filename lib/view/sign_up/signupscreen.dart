import 'package:flutter/material.dart';
import 'sign_upwidgest.dart';
import '../login/login_screen.dart';
import 'package:ai_gymhealthy_app/services/auth_service.dart';
class Signupscreen extends StatelessWidget {
   Signupscreen({super.key});
   final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isTablet = size.width > 600;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    final VoidCallback? onTap;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SafeArea(
            child: Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: isTablet ? 500 : double.infinity),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      _buildAccentBar(isDark),
                      const SizedBox(height: 15),
                      _buildHeader(isDark),
                      const SizedBox(height: 30),
                      LoginWidgets.inputField(context, Icons.email_outlined, "Jamesthomas@gmail.com"),
                      const SizedBox(height: 15),
                      LoginWidgets.inputField(context, Icons.lock_outline, "Enter Password", isPassword: true),
                      const SizedBox(height: 15),
                      LoginWidgets.inputField(context, Icons.lock_outline, "Comfrim Password", isPassword: true),
                      //_buildForgotPassword(),
                      const SizedBox(height: 25),
                      _buildLoginButton(),
                      const SizedBox(height: 18),
                      //SizedBox(height: isKeyboardVisible ? 20 : 90),
                      _buildDivider(theme),
                      const SizedBox(height:10),
                      _buildSocialRow(context, size.width, isDark),
                      //const SizedBox(height: 80),
                      SizedBox(height: isKeyboardVisible ? 20 : 90),
                      //_buildFooter(isTablet),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //_buildFooter(isTablet),
          if (!isKeyboardVisible) _buildFooter(isTablet, context),
        ],
      ),
    );
  }

  // --- Các Widget nhỏ trợ giúp (Helper Widgets) ---
  Widget _buildAccentBar(bool isDark) => Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container (
    width: 6, height: 40,
    decoration: BoxDecoration(color: isDark ? Colors.orange : Colors.blue, borderRadius: BorderRadius.circular(10)),
      ),
      const SizedBox(width: 10),
      Image.asset(
        'assets/INETIC/1-removebg-preview.png', // Thay bằng đường dẫn ảnh của bạn
        height: 60, // Chỉnh chiều cao nhỏ hơn thanh gạch một chút để cân đối
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.fitness_center, size: 30),
      ),
    ],
  );

  Widget _buildHeader(bool isDark) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("TẠO TÀI KHOẢN ", style: TextStyle(color: isDark ? Colors.white : Colors.black, fontSize: 30, fontWeight: FontWeight.bold)),
      //Text("Vào tài khoản của bạn", style: TextStyle(color: isDark ? Colors.white70 : Colors.black54, fontSize: 28, fontWeight: FontWeight.w300)),
    ],
  );

  Widget _buildSocialRow(BuildContext context, double width, bool isDark) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      LoginWidgets.socialButton(
        context, 
        imagePath: 'assets/img2/google.png', 
        screenWidth: width,
        onTap: () async {
        final user = await _authService.signInWithGoogle();
        if (user != null) {
          // Đăng ký thành công -> Chuyển vào trang chủ hoặc trang thông tin cá nhân
          Navigator.pushReplacementNamed(context, '/home'); 
        }
        },
        ),
      LoginWidgets.socialButton(context, icon: Icons.facebook, iconColor: Colors.blue, screenWidth: width),
      LoginWidgets.socialButton(context, icon: Icons.apple, iconColor: isDark ? Colors.white : Colors.black, screenWidth: width),
    ],
  );

  Widget _buildDivider(ThemeData theme) => Row(
    children: [
      Expanded(child: Divider(color: theme.dividerColor)),
      const Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Text("OR", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12))),
      Expanded(child: Divider(color: theme.dividerColor)),
    ],
  );

  //Widget _buildForgotPassword() => Align(
  //  alignment: Alignment.centerRight,
  //  child: TextButton(onPressed: () {}, child: const Text("Quên mật khẩu?", style: TextStyle(color: Colors.grey, fontSize: 12))),
 //);

  Widget _buildLoginButton() => SizedBox(
    width: double.infinity, height: 60,
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFBBF7D0),
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0,
      ),
      child: const Text("ĐĂNG KÝ", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5)),
    ),
  );

  Widget _buildFooter(bool isTablet, BuildContext context) => Positioned(
    bottom: -32, left: 0, right: 0,
    child: Center(
      child: GestureDetector(
        // SỰ KIỆN NHẤN VÀO ĐÂY
        onTap: () {
          // Chuyển sang màn hình Đăng ký
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  LoginScreen()),
          );
        },
      child: Container(
        constraints: BoxConstraints(maxWidth: isTablet ? 550 : double.infinity),
        height: 120,
        decoration: const BoxDecoration(color: Color(0xFFF5BC51), borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
        padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Bạn đã có Tài Khoản?", style: TextStyle(color: Colors.black87, fontSize: 11)),
                SizedBox(height:1),
                Text("Đăng nhập ngay", style: TextStyle(color: Colors.black, fontSize:16, fontWeight: FontWeight.bold)),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(color: Color(0xFFD1FAE5), shape: BoxShape.circle),
              child: const Icon(Icons.arrow_forward, color: Colors.black),
            )
          ],
        ),
      ),
    ),
    ),
  );
}