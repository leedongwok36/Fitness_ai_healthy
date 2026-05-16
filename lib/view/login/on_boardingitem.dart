import 'package:flutter/material.dart';
import 'on_boardingmode.dart';
import 'on_boardingsreen.dart';
import 'login_sreen.dart';
class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingPagePresenter(
        pages: [
          OnboardingPageModel(
            title: 'Chào mừng bạn đến với Kinetic',
            description:
                'Nơi bắt đầu của một phiên bản tốt hơn',
            //imageUrl: 'assets/img/on_board_1.png',
            //bgColor: Colors.indigo,
            bgImage:'assets/img/on_boarding.png',
          ),
          OnboardingPageModel(
            title: 'Truyền cảm hứng và thúc đẩy hành động',
            description: 'Nơi năng lượng chuyển động trở thành sức mạnh, giúp bạn tối ưu hóa từng bài tập để chạm đến hình thể hoàn hảo nhất.',
            //imageUrl: 'https://i.ibb.co/LvmZypG/storefront-illustration-2.png',
            //bgColor: const Color(0xff1eb090),
            bgImage:'assets/img2/on.png',
          ),
          OnboardingPageModel(
            title: 'Đừng chỉ tập luyện',
            description:
                'Hãy để Kinetic giúp bạn kiến tạo một bản thể mới mạnh mẽ hơn, bền bỉ hơn qua từng nhịp chuyển động mỗi ngày.',
            //imageUrl: 'https://i.ibb.co/420D7VP/building.png',
            //bgColor: const Color(0xfffeae4f),
            bgImage:'assets/img2/on_boarding1.png',
          ),
          OnboardingPageModel(
            title: 'Sẵn sàng bứt phá',
            description: 'Nâng Tầm Tập Luyện. Chinh Phục Giới Hạn.Hãy để Kinetic đồng hành cùng bạn ngay hôm nay!',
            //imageUrl: 'https://i.ibb.co/cJqsPSB/scooter.png',
            //bgColor: Colors.purple,
            bgImage:'assets/img2/on_boarding3.png',
          ),
        ],
        onSkip: () async {
          //final prefs = await SharedPreferences.getInstance();
          //await prefs.setBool('seenOnboarding', true);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        },

        // 🔥 THÊM NGAY TẠI ĐÂY
        onFinish: () async {
          //final prefs = await SharedPreferences.getInstance();
          //await prefs.setBool('seenOnboarding', true);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        },

      ),
    );
  }
}
