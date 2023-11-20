import 'package:flutter/material.dart';
import 'package:mechuri_r/screen/home_screen.dart';
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
                              icon: Icon(Icons.done, color: Color(0xff403831), size: 24,),
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
      endDrawer: MyDrawer()
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


/*

// 카메라로 찍거나 갤러리에서 가져온 사진 컨트롤하기 위한 변수
PickedFile _imageFile; // 카메라 갤러리에서 사진 가져올  때 사용함. (image_picker)
final ImagePicker _picker = ImagePicker(); // 카메라/갤러리에서 사진 가져올 때 사용함 (image_picker)

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
 */




