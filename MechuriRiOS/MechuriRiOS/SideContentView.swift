//
//  sideContentView.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/16/23.
//

import SwiftUI

struct SideContentView: View {
    @Binding var selectedTitle: String
    //네임스페이스 선언은 상위 뷰에 선언하고 가장 하위 뷰에 var namespace: Namespace.ID
    //궤적이 들어갈 뷰나 메소드에 namespace: namespace
    @Namespace var namespace
    @State var selectedTab = 0
    
    private var tabs: [AnyView] = [
        AnyView(NavigationView() { MainView() }),
        AnyView(NavigationView() { MyPageView() }),
        AnyView(NavigationView() { AddFriendsView() }),
        AnyView(NavigationView() { ListOfFriendsView() }),
        AnyView(NavigationView() { SendLetterView() }),
        AnyView(NavigationView() { ReceivedLetterView() }),
        AnyView(NavigationView() { AlarmView() })
    ]
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.sideViewColor.ignoresSafeArea()
            VStack {
                HStack {
                    
                    Image("sampleProfileImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.btnColor, lineWidth: 2))
                        .frame(width: 60, height: 60)
                    
                    Text("[이름]")
                        .font(.title3)
                        .fontWeight(.heavy)
                        .foregroundColor(.nameColor)
                    
                    TabButton(image: "bell", title: "", selectedTitle: $selectedTitle, namespace: namespace)
                }
                .padding(.leading, 30)
                .padding(.top, 80)
                //SideTabButton
                VStack(spacing: 5) {
                    Divider()
                        .frame(width: 180, height: 5)
                        .background(Color.borderColor)
                    TabButton(image: "person", title: "마이페이지", selectedTitle: $selectedTitle, namespace: namespace)
                    TabButton(image: "person.3", title: "친구 목록",selectedTitle: $selectedTitle, namespace: namespace)
                    TabButton(image: "person.badge.plus", title: "친구 추가", selectedTitle: $selectedTitle, namespace: namespace)
                    TabButton(image: "envelope", title: "받은 편지", selectedTitle: $selectedTitle, namespace: namespace)
                    TabButton(image: "paperplane", title: "보낸 편지", selectedTitle: $selectedTitle, namespace: namespace)
                    Divider()
                        .frame(width: 180, height: 5)
                        .background(Color.borderColor)
                    TabButton(image: "info.circle", title: "개발자 알아보기", selectedTitle: $selectedTitle, namespace: namespace)
                    TabButton(image: "square.and.arrow.up", title: "친구한테 공유하기", selectedTitle: $selectedTitle, namespace: namespace)
                    Divider()
                        .frame(width: 180, height: 5)
                        .background(Color.borderColor)
                }
                .padding(10)
                HStack(spacing: 5){ //공유버튼(미완)
                    Button{
                        //인스타그램 공유
                    }label: {
                        Text("인스타")
                    }
                    Button{
                        //페이스북 공유
                    }label: {
                        Text("페북")
                    }
                    Button{
                        //유튜브 공유
                    }label: {
                        Text("유튭")
                    }
                }
                .foregroundStyle(Color.white)
            }
            .ignoresSafeArea(edges: .bottom)
        }
        .frame(width: 240)
    }
    
}

#Preview {
    SideContentView(selectedTitle: .constant("Main"))
}
