//
//  MainViewCell.swift
//  MechuriRiOS
//
//  Created by Deokhun KIM on 11/22/23.
//

import SwiftUI

struct MainViewCell: View {
    var diary: DiaryExample
    
    var body: some View {
        VStack {
            Image(diary.imageName)
                .resizable()
                .frame(width: 170, height: 170)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(diary.title)
                .padding(.leading, 5)
            Text(diary.date)
                .foregroundStyle(Color.gray)
        }
        .padding(5)
        .background(Rectangle()
            .fill(Color.btnColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        )
    }
}

#Preview {
    MainViewCell(
        diary: DiaryExample(imageName: "sampleDiaryMainImage",
                            title: "일기장제목",
                            date: "🕚2023.09.22 ~ 09.30")
    )
}
