import 'package:flutter/material.dart';
import 'package:get/get.dart';

// void main() => runApp(MyApp(debugShowCheckedModeBanner: false));

// class MyApp extends StatelessWidget {
//   final bool debugShowCheckedModeBanner;

//   const MyApp({Key? key, this.debugShowCheckedModeBanner = true})
//       : super(key: key);

//   static const String url = '/login';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '로그인 페이지',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: LoginPage(),
//       debugShowCheckedModeBanner: debugShowCheckedModeBanner,
//     );
//   }
// }

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String url = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0F6626),
              Color(0xFF7EB78D),
            ],
            stops: [0.5, 1.0], // 그라데이션 지정
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png', // 로고 이미지 경로
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'CLIP',
                    style: TextStyle(
                      fontFamily: 'Kantumruy',
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF6DAB7D).withOpacity(0.68), // 네모 칸 색
                  borderRadius: BorderRadius.circular(10), // 모서리 라운드 처리
                ),
                child: const Text(
                  '퀘스트 참여를 통해 환경을 지키는\n챌린지 앱입니다.',
                  style: TextStyle(
                    fontFamily: 'Kantumruy',
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '로그인 후 이용해주세요.',
                style: TextStyle(
                  fontFamily: 'Kantumruy',
                  fontSize: 14,
                  color: Color(0xFFC6E5D3),
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                // onTap: () async {
                //   // 구글 로그인 기능 추가
                //   googleSingIn();
                //   //로그인 성공적이면 main페이지로 이동하는 코드 추가
                //   //최초 로그인이면 회원정보 입력하는 페이지로 이동하는 코드 추가하기
                //   if (await googleSingIn() == 1) {
                //     Navigator.pushNamed(context, '/main');
                //   } else if (await googleSingIn() == 2) {
                //     Navigator.pushNamed(context, '/signup');
                //   } else {
                //     showSnackBar();
                //   }
                // },
                child: Image.asset(
                  'assets/login.png',
                  width: 180,
                  height: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showSnackBar() {
  Get.snackbar(
    "알림",
    "구글 로그인에 실패했습니다.",
    snackPosition: SnackPosition.TOP,
    backgroundColor: const Color.fromARGB(71, 255, 255, 255),
    colorText: Colors.black,
  );
}
