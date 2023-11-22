//
//  DiaryDetailMenuView.swift
//  MechuriRiOS
//
//  Created by 노주영 on 2023/11/22.
//

import SwiftUI

struct DiaryDetailMenuView: View {
    private let menuList: [String] = ["일기 쓰기", "멤버 목록", "일기장 관리", "일기장 삭제"]
    
    var body: some View {
        VStack {
            ForEach(0..<4, id: \.self) { i in
                Button {
                    //MARK: 0 -> 일기 쓰기, 1 -> 멤버 목록, 2 -> 일기장 관리, 3 -> 일기장 삭제 // 해당 인덱스에 맞는 액션 구현
                    switch i {
                    case 0:         print("일기 쓰기 엑션")
                    case 1:         print("멤버 목록 엑션")
                    case 2:         print("일기장 관리 엑션")
                    case 3:         print("일기장 삭제 엑션")
                    default:        print("이건 머?")
                    }
                } label: {
                    Text("\(menuList[i])")
                        .padding(10)
                        .font(.custom("Cafe24Ssurround", size: 15))
                        .foregroundStyle(i == 3 ? .red : Color.fontColor)
                        .bold()
                        .frame(width: UIScreen.main.bounds.width/3)
                }
                .background( i == 3 ? RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(.white)
                    .shadow(color: .white, radius: 0, x: 0, y: 0) : RoundedRectangle(cornerRadius: 0)
                        .foregroundColor(.white)
                        .shadow(color: .gray, radius: 1, x: 1, y: 1)
                )
                .padding(.top, i == 0 ? -8 : -7)
            }
            Spacer()
        }
    }
}

#Preview {
    DiaryDetailMenuView()
}
