//
//  DiaryDetailView.swift
//  MechuriRiOS
//
//  Created by 노주영 on 2023/11/22.
//

import SwiftUI

struct DiaryDetailView: View {
    private var deviceSize: CGRect {
        return UIScreen.main.bounds
    }
    
    @Environment(\.dismiss) private var dismiss
    
    @State var selectedTitle = "Main"
    @State var selectedTab: TabSelector = .main
    
    @State private var isShowMenu: Bool = false
    @State private var isShowing: Bool = false
    
    @State private var offsetX: CGFloat = 318
    @State private var opacity: CGFloat = 0.01
    @State private var buttonOffsetX: CGFloat = 0
    @State private var menuButtonImage: String = "line.3.horizontal"
    
    @State var diaryList: [GetDiary] = []                //방에 있는 일기 리스트(OnAppear에서 임시로 넣어놓음)
    var data: ExDiary                                    //전 화면의 정보
    
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea()
            
            VStack {
                VStack {
                    //메추리랑 사이드바 여는 버튼
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Text("<")
                                .font(.Cafe2418)
                                .foregroundStyle(Color.fontColor)
                        }
                        .padding(.leading, 20)
                        
                        Spacer()
                        
                        Image("mechuri1")
                            .resizable()
                            .frame(width: 30,height: 30)
                        
                        Spacer()
                        
                        Button {
                            isShowing.toggle()
                        } label: {
                            Image(systemName: menuButtonImage)
                                .resizable()
                                .frame(width: 23, height: 20)
                                .foregroundStyle(Color.gray)
                        }
                        .offset(x: buttonOffsetX)
                        .padding(.trailing, 20)
                    }
                    
                    //타이틀이랑 메뉴열기(?)버튼
                    ZStack {
                        HStack {
                            Text("\(data.exDiaryName)")
                                .font(.Cafe2418)
                                .foregroundStyle(Color.fontColor)
                                .bold()
                        }
                        .background(Rectangle()
                            .fill(Color.btnColor)
                            .frame(width: deviceSize.width, height: 40)
                        )
                        
                        HStack {
                            Spacer()
                            Button { isShowMenu.toggle() } label: {
                                Image(systemName: "ellipsis")
                                    .foregroundStyle(Color.gray)
                                    .bold()
                            }
                            .frame(width: 23, height: 20)
                            .padding(.trailing, 20)
                        }
                    }
                }
                .padding(.top, 50)
                
                ZStack {
                    ScrollView {
                        ForEach(diaryList, id: \.self.diaryId) { diary in
                            DiaryDetailCell(diary: diary)
                        }
                    }
                    .padding(.bottom, 50)
                    
                    //땡땡땡 표시 눌렀을 때 나오는 뷰
                    HStack {
                        Spacer()
                        DiaryDetailMenuView()
                    }
                    .padding(.top, -10)
                    .opacity(isShowMenu ? 1 : 0)
                }
            }
            
            //사이드 화면
            HStack {
                SideContentView(selectedTitle: $selectedTitle, selectedTab: $selectedTab)
                    .frame(
                        width: deviceSize.width / 2,
                        height: deviceSize.height)
                    .foregroundColor(.sideViewColor)
                    .offset(x: offsetX)      //일단 이러면 다른 기기 깨짐
            }
        }
        .onChange(of: isShowing) { oldValue, newValue in
            withAnimation {
                if newValue {
                    offsetX = 80 //임시.. 해결책 필요함
                    opacity = 0.3
                    buttonOffsetX = -(deviceSize.width/2 + 30)
                    menuButtonImage = "arrow.forward"
                } else {
                    offsetX = 318
                    opacity = 0.01
                    buttonOffsetX = 0
                    menuButtonImage = "line.3.horizontal"
                }
            }
        }
        .background(Color.bgColor)
        .background(ignoresSafeAreaEdges: .all)
        .navigationBarBackButtonHidden()
        
        .onAppear {
            //MARK: 방에 있는 일기 리스트 ->  전 화면 모델에 없는 것 -> diaryId, userId, writing, img, 날씨
            self.diaryList = [
                GetDiary(diaryId: 1, exDiaryId: data.exDiaryId, userId: 1, createdDate: data.createdDate, modifiedDate: "", writing: "아 저녁먹어야지~~~~~~~~~~~~~~", img: "sampleProfileImage"),
                GetDiary(diaryId: 2, exDiaryId: data.exDiaryId, userId: 2, createdDate: data.createdDate, modifiedDate: "", writing: "목아프다ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ", img: "sampleDiaryMainImage"),
                GetDiary(diaryId: 3, exDiaryId: data.exDiaryId, userId: 3, createdDate: data.createdDate, modifiedDate: "", writing: "덱훈 센세 잘생김", img: "mechuri2"),
                GetDiary(diaryId: 4, exDiaryId: data.exDiaryId, userId: 4, createdDate: data.createdDate, modifiedDate: "", writing: "캬ㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑ", img: "sampleDiaryMainImage"),
                GetDiary(diaryId: 5, exDiaryId: data.exDiaryId, userId: 5, createdDate: data.createdDate, modifiedDate: "", writing: "메모리 추억 리멤버 알림장 메모리 추억 리멤버 알림장 메모리 추억 리멤버 알림장 메모리 추억 리멤버 알림장 메모리 추억 리멤버 알림장", img: "mechuri1")
            ]
        }
    }
}
