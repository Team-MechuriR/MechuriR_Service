//
//  LoginView.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/3/23.
//

import SwiftUI

struct LoginView: View {
    @State private var id = ""
    @State private var password = ""
    var body: some View {
        ZStack{
            Color("bgColor").ignoresSafeArea()
            VStack{
                Image("mechuri1")
                    .resizable()
                    .frame(width: 100, height: 100)
                Button(action: btnpress, label: {
                    Text("카카오")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                        .frame(width: 277, height: 46)
                })
                .background()
                Button(action: btnpress, label: {
                    Text("네이버")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                        .frame(width: 277, height: 46)
                })
                .background()
                Button(action: btnpress, label: {
                    Text("구글")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                        .frame(width: 277, height: 46)
                })
                .background()
                TextField("ID", text: $id)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 277, height: 46)
                TextField("PASSWORD", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 277, height: 46)
                Button(action: btnpress, label: {
                    Text("로그인")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                        .frame(width: 277, height: 46)
                })
                .background()
                HStack{
                    Text("아이디 찾기")
                    Text("|")
                    Text("비밀번호 찾기")
                    Text("|")
                    Text("회원가입")
                }
            }
        }
        
    }
    func btnpress(){
    }
}


#Preview {
    LoginView()
}
