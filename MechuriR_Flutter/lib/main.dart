import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MechuriR',  // AppName
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light, // LightMode
        //primaryColor: Color(0xffF3EFE4), // 강조색
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

        textTheme: const TextTheme(

        )
        //Define the default font family.
        //fontFamily: '',
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,  // 가운데 정렬
        title: Image.asset('logo.png', height: 30,) // 로고 이미지
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton( // 플로팅 버튼
          onPressed: _incrementCounter,
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

class TextStyle extends StatelessWidget {
  const TextStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

