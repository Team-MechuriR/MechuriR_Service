import 'package:flutter/material.dart';
import 'package:mechuri_r/providers/counts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'MechuriR',  // AppName
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light, // LightMode
        scaffoldBackgroundColor: Color(0xffF3EFE4), // 앱 배경색


        // AppBar
        appBarTheme: const AppBarTheme(
          //shadowColor: Colors.black,
          backgroundColor: Color(0xffF3EFE4), // 상단바 배경색
        ),

        // FloatingActionButton
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color(0xffD4C4AB) // 플로팅 버튼 배경색
        ),
      ),
      home: const LoginPage(),);
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          controller: ScrollController(),
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/logo.png', width: 100, height: 100,),
                  SizedBox(width: 277, height: 46,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xffFAE100), // 배경색
                          onPrimary: Color(0xff3C1E1E), // 글자색
                          shadowColor: Color(0xffC8C8C8), // 그림자색
                          shape: RoundedRectangleBorder( // radius
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/kakao_icon.png', width: 38,),
                          Text('카카오 계정으로 로그인하기'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 277, height: 46,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff00BF18), // 배경색
                          onPrimary: Color(0xffffffff), // 글자색
                          shadowColor: Color(0xffC8C8C8), // 그림자색
                          shape: RoundedRectangleBorder( // radius
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/naver_icon.png', width: 38,),
                          Text('네이버 계정으로 로그인하기'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 277, height: 46,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xffffffff), // 배경색
                          onPrimary: Color(0xff7E7E7E), // 글자색
                          shadowColor: Color(0xffC8C8C8), // 그림자색
                          shape: RoundedRectangleBorder( // radius
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/google_icon.png', width: 38,),
                          Text('구글 계정으로 로그인하기'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: SizedBox(
          width: 60,
          height: 60,
          child: FloatingActionButton( // 플로팅 버튼
              onPressed: (){},
              tooltip: 'New',
              child: SizedBox(
                width: 60,
                height: 60,
                child : Icon(Icons.add,),
              )
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class BtnStyle extends StatelessWidget {
  const BtnStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}