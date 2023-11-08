import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

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
      home: const MyPage(),);
  }
}






class MyPage extends StatelessWidget {
  const MyPage({super.key});

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
                        Row(
                          mainAxisAlignment : MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                icon: Icon(Icons.close, color: Color(0xff403831),),
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                            ),
                            Text('마이페이지', style: TextStyle(color: Color(0xff403831), fontWeight: FontWeight.bold),),
                            IconButton(
                              icon: Icon(Icons.done, color: Color(0xff403831),),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ]
                  ),
                ),
              ),

            ],
          ),

        ],
      ),
      endDrawer: Container(
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
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.group, color: Colors.white,),
                      title: Text('친구 목룍', style: TextStyle(color: Colors.white),),
                      onTap: (){
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.person_add, color: Colors.white,),
                      title: Text('친구 추가', style: TextStyle(color: Colors.white),),
                      onTap: (){
                        Navigator.pop(context);
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
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



PickedFile _imageFile;
final ImagePicker _picker = ImagePicker();

Widget imageProfile(){
  return Center(
    child: Stack(
      children: [<Widget>[
        CircleAvatar(
          radius: 170,
          backgroundImage: _imageFile == null
            ? AssetImage('assets/profile1.png'):FileImage(File(_imageFile.path)),
        ),
        Positioned(
          bottom: 20, right: 20,
          child: InkWell(
            onTap: (){
              // 클릭시 모달 팝업을 띄워준다.
              showModalBottomSheet(context: context, builder: ((builder)=>bottomSheet()));
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
              size:40,
            ),
          ),
        )
      ]],
    ),
  )
}




