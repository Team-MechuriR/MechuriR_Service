//
//  HomeView.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/16/23.
//

import SwiftUI

struct HomeView: View { //컨트롤뷰
    
    @Binding var selectedTitle: String
    
    var body: some View {
        
        TabView(selection: $selectedTitle) { //탭버튼시 돌아갈 곳
            MainView()
                .tag("Main")
            MyPageView()
                .tag("마이페이지")
            AddFriendsView()
                .tag("친구 추가")
            ListOfFriendsView()
                .tag("친구 목록")
            SendLetterView()
                .tag("보낸 편지")
            ReceivedLetterView()
                .tag("받은 편지")
            AlarmView()
                .tag("")
        }
        .frame(width: getRect().width)
    }
}
