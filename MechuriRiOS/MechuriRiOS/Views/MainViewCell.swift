//
//  MainViewCell.swift
//  MechuriRiOS
//
//  Created by Deokhun KIM on 11/22/23.
//

import SwiftUI

struct MainViewCell: View {
    var diary: ExDiary
    
    var body: some View {
        VStack {
            // MARK: - imageData 오면 넣기
            Image("sampleDiaryMainImage")
                .resizable()
                .frame(width: 170, height: 170)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(diary.exDiaryName)
                .padding(.leading, 5)
            Text("🕚\(diary.startDate) ~ \(diary.finishDate)")
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
        diary: ExDiary(exDiaryId: 1,
                       createdDate: "2023.09.22",
                       modifiedDate: "",
                       startDate: "2023.09.22",
                       finishDate: "09.30",
                       exDiaryName: "일기장 제목",
                       createMemberName: "만채")
    )
}
