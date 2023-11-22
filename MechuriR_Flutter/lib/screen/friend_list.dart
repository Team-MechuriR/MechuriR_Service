import 'dart:html';
import 'dart:js';

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:mechuri_r/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}



// 검색어
String searchText = '';

// 리스트뷰에 표시할 내용
List<String> items = ['User1', 'User2', 'User3', 'User4'];
List<String> itemContents = ['User1 Img', 'User2 Img', 'User3 Img', 'User4 Img'];




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  //MyAppState crateState() => MyAppState();
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
      home: const FriendList(),);
  }
}






class FriendList extends StatelessWidget {
  const FriendList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,  // 가운데 정렬
        title: Image.asset('images/logo.png', height: 35,), // 로고 이미지
        foregroundColor: Color(0xff878787),
      ),
      body: Container(
        child: ListView(
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
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(width: 24,),
                                Text('친구 목록', style: TextStyle(color: Color(0xff403831), fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                                IconButton(
                                  icon: Icon(Icons.person_add, color: Color(0xff403831), size: 24),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText: '| 친구 검색',
                              hintStyle: TextStyle (color: Color(0xffCDC7C2), fontSize: 13),
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.close, color: Color(0xff403831),)
                            ),

                          ),
                          /*
                          Expanded(
                              child: ListView.builder(
                                itemCount: items.length,
                                  itemBuilder: (BuildContext context, int index){
                                    // 검색 기능, 검색어가 있을 경우
                                    if(searchText.isNotEmpty && !items[index].toLowerCase().contains(searchText.toLowerCase())){
                                      return SizedBox.shrink();
                                    }
                                    // 검색어 없을 경우, 모든 항목 표시
                                    else{
                                      return Card(
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.elliptical(5, 5))
                                        ),
                                        child: ListTile(
                                          title: Text(items[index]),
                                        ),
                                      );
                                    }

                          })
                          )*/

                        ]
                    ),
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
      endDrawer: MyDrawer()
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



/*

Widget build(BuildContext context){
  return Scaffold(
    appBar: searchPageHeader(), // 검색창
    body: futureSearchResult == null ? displayNoSearchScreen() : displayUserFoundScreen(), // 검색 결과 및 친구 목록
  );
}


// **검색창 상단 만들기
TextEditingController searchTextEditingController = TextEditingController(); // 검색창 입력 내용 controller
Future<QuerySnapshot> futreSearchResult; // DB에서 검색된 사용자를 가져오는데 활용되는 변수

// x아이콘 ㅡㄹ릭시 검색어 삭제
emptyTheTextFormField(){
  searchTextEditingController.clear();
}

// 검색어 입력 후 submit하면 DB에서 검색어와 일치하거나 포함하는 결과 가져와서 future 변수에 저장
controlSearching(str){
  print(str);
  Future<QuerySnapshot> allUsers = userRefence.where('profileName', isGreaterThanOrEqualTo: str).get();
  setState((){
    futreSearchResult = allUsers;
  });
}
*/

/*
TextEditingController searchTextEditingController = TextEditingController(); // 검색창 입력 내용 controller

// 검색페이지 상단 부분
AppBar searchPageHeader(){
  return AppBar(
    backgroundColor: Colors.white,
    title: TextFormField(
      textInputAction: TextInputAction.search,
      onFieldSubmitted: (String value){ // TextFormField 입력값 반환
        print('value = $value');
      },
      controller: searchTextEditingController, // 검색창 controller
      decoration: InputDecoration(
        hintText: "|  친구 검색",
        hintStyle: TextStyle(
          color: Color(0xffCDC7C2),
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffD4C4AB))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff403831))),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear, color: Color(0xff403831),),
          onPressed: (){

          },)
      ),
      style: TextStyle(fontSize: 13, color: Color(0xffCDC7C2)),
      )
    );
}


// 검색어 입력 전 초기 상태
displayNoSearchResultScreen(){
 // final Orientation orientation = MediaQuery.of(context).orientation;
  return Container(
    child: Center(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[

        ],
      ),
    ),
  );
}
 */





/*
displayUserFoundScreen(){
  return FutureBuilder(future: futureSearchResults, builder: (context, snapshot){
    if(!snapshot.hasData) return circularProgress();

    List<UserResult> searchUserResult = [];
    snapshot.data.documents.forEach((document){
      User users = User.fromDocument(document);
      UserResult userResult = UserResult(users);
      searchUserResult.add(userResult);
    });

    return ListView(children: searchUserResult,);
  });
}
*/

class UserResult extends StatelessWidget {
  //final User eachUser;
  //UserResult(this.eachUser);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:EdgeInsets.all(3),
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  print('tapped');
                },
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20), // 좌우 패딩
                  minVerticalPadding: 20, // listTile의 세로 패딩 값 설정
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    //backgroundImage: eachUser.url == null ? circularProgress() : CachedNetworkImageProvider(eachUser.url,),
                  ),
                  title: Text("User1", style: TextStyle(
                    color: Color(0xff403831),
                    fontSize: 13,
                    ),
                  ),
                  trailing: Row(
                    children: [
                      IconButton(
                          onPressed: (){}, icon: Icon(Icons.send, color: Color(0xff403831),)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle, color: Color(0xffFC3528),))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}

/*
class MyAppState extends State<MyApp> {
  void cardClickEvent(BuildContext context, int index){
    String content = itemContents[index];
    Navigator.push(context, MaterialPageRoute(builder: (context)=> ContentPage(content:content),
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

*/
class ContentPage extends StatelessWidget {
  final String content;

  const ContentPage({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Content'),
      ),
      body: Center(
        child: Text(content),
      ),
    );
  }
}
