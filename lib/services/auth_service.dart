import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Hàm xử lý đăng nhập Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // 1. Kích hoạt luồng đăng nhập của Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // Người dùng hủy đăng nhập

      // 2. Lấy thông tin xác thực từ yêu cầu
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // 3. Tạo credential mới cho Firebase
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // 4. Đăng nhập vào Firebase và trả về user
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print("Lỗi đăng nhập Google: $e");
      return null;
    }
  }

  // Hàm đăng xuất
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}