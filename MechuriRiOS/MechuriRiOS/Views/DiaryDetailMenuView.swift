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
                NavigationLink {
                    switch i {
                    case 0:
                        MakeNewDiaryContentView(diaryType: .diary)
                    case 1:
                        MakeNewDiaryContentView(diaryType: .diary)
                    case 2:
                        MakeNewDiaryContentView(diaryType: .diary)
                    case 3:
                        MakeNewDiaryContentView(diaryType: .diary)
                    default:
                        MakeNewDiaryContentView(diaryType: .diary)
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
