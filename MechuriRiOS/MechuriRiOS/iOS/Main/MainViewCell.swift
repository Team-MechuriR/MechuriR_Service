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
        VStack(alignment: .leading) {
            // MARK: - imageData 오면 넣기
            Image("sampleDiaryMainImage")
                .resizable()
                .frame(width: 170, height: 170)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(diary.exDiaryName)
                .padding(.leading, 5)
                .font(.Cafe2414)
                .bold()
            
            Text("🕚\(diary.startDate) ~ \(diary.finishDate)")
                .foregroundStyle(Color.gray)
                .font(.Cafe24Air14)
        }
        .padding(5)
        .background(Rectangle()
            .fill(Color.btnColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        )
    }
}
