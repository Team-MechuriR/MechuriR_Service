//
//  NextPageView.swift
//  KaKao_Login
//
//  Created by 강치우 on 11/22/23.
//

// 임시로 다음 로그인 화면 만든 뷰임. 나중에 삭제 요망.

import SwiftUI
import GoogleSignIn

struct NextPageView: View {
    // 화면 종료
    @Environment(\.dismiss) private var dismiss
    // 유저 데이터 바인딩
    @Binding var userData: UserData
    
    var body: some View {
        VStack(spacing: 30) {
            // 프로필
            AsyncImage(url: userData.url)
                .imageScale(.small)
                .frame(width: 180, height: 180, alignment: .center)
                .padding(EdgeInsets(top: 60, leading: 0, bottom: 0, trailing: 0))
            // 이름
            Text(userData.name)
            // 이메일
            Text(userData.email)
            
            Spacer()
            
            HStack {
                // 로그아웃 버튼
                Button {
                    logout()
                } label: {
                    Text("로그아웃")
                }
                .frame(width: 60, height: 33, alignment: .bottom)
                .padding(EdgeInsets(top: 0, leading: 30, bottom: 30, trailing: 0))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        // 뒤로 가기 버튼 숨김
        .navigationBarBackButtonHidden(true)
    }
    // 로그아웃
    func logout() {
        GIDSignIn.sharedInstance.signOut()
        // 메인으로 돌아가기
        dismiss()
    }
}

#Preview {
    NextPageView(userData: .constant(UserData(url: nil, name: "이름", email: "이메일")))
}
