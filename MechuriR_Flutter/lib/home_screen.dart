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
        appBar: AppBar(
          centerTitle: true,  // 가운데 정렬
          title: Image.asset('images/logo.png', height: 30,), // 로고 이미지
          actions: [
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.menu_rounded))
          ],
        ),
        body: ListView(
          controller: ScrollController(),
          children: [Text('안녕')],
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