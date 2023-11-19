import 'package:flutter/material.dart';
import 'dart:io';

import 'package:mechuri_r/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'MechuriR',  // AppName
      debugShowCheckedModeBanner: false, // 앱 상단에 디버그 라벨 제거
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
      home: const AddFriend(),);
  }
}






class AddFriend extends StatelessWidget {
  const AddFriend ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,  // 가운데 정렬
          title: Image.asset('images/logo.png', height: 35,), // 로고 이미지
          foregroundColor: Color(0xff878787),
        ),
        body: ListView(
          controller: ScrollController(),
          children: [
            Column(
              children: [
                Container(width: double.infinity, height: 40, color: Color(0xffD4C4AB),
                  child: Container(margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('친구 추가', style: TextStyle(color: Color(0xff403831), fontWeight: FontWeight.bold),),
                      ],
                    )
                    ),
                  )
              ],
            ),

          ],
        ),
        endDrawer: MyDrawer()
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


