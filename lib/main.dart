import 'package:ai_gymhealthy_app/view/login/on_boardingitem.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//import 'package:flutter/_p'
//import 'view/login/on_boardingitem.dart';
//import 'view/login/on_boardingsreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthy Gym',
      debugShowCheckedModeBanner: false,
      home: const OnBoardingItem(),
      // Cấu hình Theme Tối (Dark Mode)
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        cardColor: const Color(0xFF262626), // Màu các ô nhập liệu
        dividerColor: Colors.white24,
      ),
      // Cấu hình Theme Sáng (Light Mode)
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF8F8F8),
        cardColor: Colors.white,
        dividerColor: Colors.black12,
        //fontFamily: "Roboto",
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      themeMode: ThemeMode.system, // Tự động theo cài đặt máy
      
    );
  }
}
