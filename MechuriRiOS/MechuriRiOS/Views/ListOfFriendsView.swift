//
//  ListOfFriendsView.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/16/23.
//

import SwiftUI

//(민채)
//MARK: 친구목록뷰

struct ListOfFriendsView: View {
    public var deviceSize: CGRect {
        return UIScreen.main.bounds
    }
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea()
            
            VStack{
                Image("mechuri1") //로고 이미지
                    .resizable()
                    .frame(width: 30,height: 30)
                
                HStack{
                    
                    Spacer()
                    
                    Text("친구 목록")
                        .font(.Cafe2418)
                        .foregroundStyle(Color.fontColor)
                        .bold()
                        .padding(7)
                    
                    Spacer()
                    
                }
                .background(Rectangle()
                    .fill(Color.btnColor)
                    .frame(width: deviceSize.width, height: 40)
                )
                
                
                
            } //상단 탭바
            
        }
        .frame(width: getRect().width, alignment: .leading)
    }
}
#Preview {
    ListOfFriendsView()
}
