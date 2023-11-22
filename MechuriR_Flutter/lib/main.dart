import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mechuri_r/screen/HomeView.dart';

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
        fontFamily: 'cafe',

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

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginState();
}


class _LoginState extends State<LoginPage> {
  // 자동 로그인 여부
  bool switchValue = false;

  // 아이디와 비밀번호 정보
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var paddingNum = 20.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body: ListView(
          controller: ScrollController(),
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40,),
                  Image.asset('images/logo.png', width: 100, height: 100, ), // 로고

                  SizedBox(height: 30,),
                  SizedBox(width: 277, height: 46,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xffFAE100), // 배경색
                          onPrimary: Color(0xff3C1E1E), // 글자색
                          shadowColor: Color(0xffC8C8C8), // 그림자색
                          shape: RoundedRectangleBorder( // radius
                              borderRadius: BorderRadius.circular(10)
                          ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/kakao_icon.png', width: 38,),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 3)),
                          Text('카카오 계정으로 로그인하기', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: paddingNum,),
                  SizedBox(width: 277, height: 46,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff03C75A), // 배경색
                        onPrimary: Color(0xffFFFFFF), // 글자색
                        shadowColor: Color(0xffC8C8C8), // 그림자색
                        shape: RoundedRectangleBorder( // radius
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/naver_icon.png', width: 25,),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 3)),
                          Text('네이버 계정으로 로그인하기', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: paddingNum,),
                  SizedBox(width: 277, height: 46,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffFFFFFF), // 배경색
                        onPrimary: Color(0xff7E7E7E), // 글자색
                        shadowColor: Color(0xffC8C8C8), // 그림자색
                        shape: RoundedRectangleBorder( // radius
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/google_icon.png', width: 38,),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 3)),
                          Text('구글 계정으로 로그인하기', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: paddingNum,),
                  SizedBox(width: 277, height: 46,
                  child: CupertinoTextField(
                    controller: userIdController,
                    placeholder: "ID",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Color(0xffC8C8C8)),
                  ),
                  ),

                  SizedBox(height: paddingNum,),
                  SizedBox(width: 277, height: 46,
                    child: CupertinoTextField(
                      controller: passwordController,
                      placeholder: "PASSWORD",
                      textAlign: TextAlign.start,
                      obscureText: true,
                      style: TextStyle(color: Color(0xffC8C8C8)),
                    ),
                  ),


                  SizedBox(height: paddingNum,),
                  //로그인 버튼
                  SizedBox(width: 277, height: 46,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomeView())
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffD4C4AB), // 배경색
                        onPrimary: Color(0xffFFFFFF), // 글자색
                        shadowColor: Color(0xffC8C8C8), // 그림자색
                        shape: RoundedRectangleBorder( // radius
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      child: Text('로그인', style: TextStyle(fontSize: 16),)
                    ),
                  ),

                  SizedBox(height: paddingNum,),
                  SizedBox(
                    width: 320,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: (){},
                            child: Text("아이디 찾기", style: TextStyle(fontSize: 16, color: Color(0xff878787)),)),
                        Text("|", style: TextStyle(fontSize: 16, color: Color(0xff878787)),),
                        TextButton(
                            onPressed: (){},
                            child: Text("비밀번호 찾기", style: TextStyle(fontSize: 16, color: Color(0xff878787)),)),
                        Text("|", style: TextStyle(fontSize: 16, color: Color(0xff878787)),),
                        TextButton(
                            onPressed: (){},
                            child: Text("회원가입", style: TextStyle(fontSize: 16, color: Color(0xff878787)),)),
                      ],
                    ),
                  )
                  ]
              ),
            )
          ],
        ),
      )
    );
  }
}




class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
            Container(width: double.infinity, height: 40, color: Color(0xffD4C4AB),
              child: Container(margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('[user name]의 일기장', style: TextStyle(color: Color(0xff403831), fontWeight: FontWeight.w900),),]
                ),
              ),
            )
          ],
        ),
        floatingActionButton: SizedBox(
          width: 60,
          height: 60,
          child: FloatingActionButton( // 플로팅 버튼
              onPressed: (){

              },
              tooltip: 'New',
              child: SizedBox(
                width: 60,
                height: 60,
                child : Icon(Icons.add,),
              )
          ),
        ),
        endDrawer: MyDrawer()
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}






class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Drawer(
        backgroundColor: Color(0xff595045),
        child: ListView(
          padding: EdgeInsets.zero, // 없으면 상단 부분 잘림
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 5),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.white,),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ), // X표시
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('images/profile1.png', width: 45, height: 45,),
                      Text('[이름]', style: TextStyle(color: Color(0xffF3E6C6)),),
                      Text('님', style: TextStyle(color: Colors.white),),
                      IconButton(
                        icon: Icon(Icons.notifications, color: Colors.white),
                        onPressed: (){},
                      )
                    ],

                  ),
                  Divider(
                    thickness: 1,
                    color: Color(0xffF3E6C6),
                    height: 50,
                  ),

                  ListTile(
                    leading: Icon(Icons.person, color: Colors.white,),
                    title: Text('마이페이지', style: TextStyle(color: Colors.white),),
                    onTap: (){

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.group, color: Colors.white,),
                    title: Text('친구 목룍', style: TextStyle(color: Colors.white),),
                    onTap: (){

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person_add, color: Colors.white,),
                    title: Text('친구 추가', style: TextStyle(color: Colors.white),),
                    onTap: (){

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.mail, color: Colors.white,),
                    title: Text('받은 편지', style: TextStyle(color: Colors.white),),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.send, color: Colors.white,),
                    title: Text('보낸 편지', style: TextStyle(color: Colors.white),),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                  Divider(
                    thickness: 1,
                    color: Color(0xffF3E6C6),
                    height: 50,
                  ),
                  ListTile(
                    leading: Icon(Icons.info_outline, color: Colors.white,),
                    title: Text('개발자 알아보기', style: TextStyle(color: Colors.white),),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.ios_share, color: Colors.white,),
                    title: Text('친구한테 공유하기', style: TextStyle(color: Colors.white),),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                  Divider(
                    thickness: 1,
                    color: Color(0xffF3E6C6),
                    height: 50,
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: (){},
                          child: Image.asset('images/insta_logo.png')
                      ),
                      TextButton(
                          onPressed: (){},
                          child: Image.asset('images/facebook_logo.png')
                      ),
                      TextButton(
                          onPressed: (){},
                          child: Image.asset('images/youtube_logo.png')
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}