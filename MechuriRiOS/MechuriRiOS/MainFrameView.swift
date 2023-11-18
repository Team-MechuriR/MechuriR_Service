//
//  SideFrameView.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/15/23.
//

import SwiftUI

struct MainFrameView: View { //명칭 메인프레임뷰로 바꿀 예정
    private var deviceSize: CGRect {
        return UIScreen.main.bounds
    }
    @State var selectedTitle = "Main"
    @State private var offsetX: CGFloat = 318
    @State private var opacity: CGFloat = 0.01
    @State private var isShowing: Bool = false
    @State private var translation: CGSize = .zero
    @State private var buttonOffsetX: CGFloat = 0
    @State private var menuButtonImage: String = "line.3.horizontal"
    
    //TabView를 사용하면(스크롤 미사용시) 보이지 않는 페이지버튼이 하단에 TabBar로 생성된다. 이것을 제거하는 초기화 코드
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            Color("bgColor").ignoresSafeArea()
            
            HomeView(selectedTitle: $selectedTitle)
                .frame(width: deviceSize.width, height: deviceSize.height)
                .overlay {
                    SideContentView(selectedTitle: $selectedTitle)
                        .frame(
                            width: deviceSize.width / 2,
                            height: deviceSize.height)
                        .foregroundColor(.sideViewColor)
                        .offset(x: offsetX)
                        .ignoresSafeArea()
                }
            HStack {
                
                Spacer()
                
                VStack {
                    Button {
                        isShowing.toggle()
                    } label: {
                        Image(systemName: menuButtonImage)
                            .resizable()
                            .frame(width: 23, height: 20)
                            .foregroundStyle(Color.gray)
                            .padding(2)
                    }
                    .tint(.blue)
                    .padding(.top, 50)
                    .padding(.trailing, 20)
                    .offset(x: buttonOffsetX) // 버튼 위치
                    
                    Spacer()
                    
                }
                
            }
        }
        //드래그로 사이드 메뉴 열기
        .gesture(
            DragGesture()
                .onChanged { value in
                    translation = value.translation
                }
                .onEnded {_ in
                    withAnimation(.spring()) {
                        let dragOffset = translation.width + offsetX
                        
                        if dragOffset > -80 && isShowing {
                            isShowing = false
                        } else if dragOffset < 80 && isShowing == false {
                            isShowing = true
                        }
                        translation = .zero
                    }
                }
        )
        .onChange(of: isShowing) { oldValue, newValue in
            withAnimation {
                if newValue {
                    offsetX = 80 //임시.. 해결책 필요함
                    opacity = 0.3
                    buttonOffsetX = -230
                    menuButtonImage = "arrow.forward"
                } else {
                    offsetX = 318
                    opacity = 0.01
                    buttonOffsetX = 0
                    menuButtonImage = "line.3.horizontal"
                }
            }
        }
    }
}

extension View {
    
    func getRect() -> CGRect {
        
        return UIScreen.main.bounds
    }
}

#Preview {
    MainFrameView()
}
