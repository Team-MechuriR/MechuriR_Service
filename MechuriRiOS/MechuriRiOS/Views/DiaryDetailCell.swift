//
//  DiaryDetailCell.swift
//  MechuriRiOS
//
//  Created by 노주영 on 2023/11/22.
//

import SwiftUI

struct DiaryDetailCell: View {
    var content: String
    
    var body: some View {
        VStack(alignment: .leading) {
            //이름 라인
            HStack(alignment: .bottom) {
                Text("이름 : \(content)")             //글쓴이
                    .font(.custom("Cafe24Ssurround", size: 15))
                    .foregroundStyle(Color.fontColor)
                    .bold()
                
                Spacer()
                Image("mechuri1")
                    .resizable()
                    .frame(width: 25,height: 25)
                
                Image("mechuri1")
                    .resizable()
                    .frame(width: 25,height: 25)
            }
            
            //일기장 이미지
            VStack {
                HStack {
                    Text("2023년 12월 25일")         //작성일
                        .font(.custom("Cafe24Ssurround", size: 15))
                        .foregroundStyle(Color.fontColor)
                        .bold()
                        .padding(.top, 10)
                    
                    Spacer()
                    Text("날씨: 🌨️")                //작성일 날씨
                        .font(.custom("Cafe24Ssurround", size: 15))
                        .foregroundStyle(Color.fontColor)
                        .bold()
                        .padding(.top, 10)
                }
                .padding(.horizontal, 20)
                
                Image("mechuri1")                  //일기장 사진
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .border(.black, width: 1)
            }
            .border(.black, width: 1)
            
            Text("asdasaddsasdasdasdadsasdas")     //일기장 내용
                .padding(.vertical, 10)
                .padding(.horizontal)
                .multilineTextAlignment(.leading)
                .font(.custom("Cafe24SsurroundAir", size: 12))
                .frame(width: UIScreen.main.bounds.width - 40, alignment: .leading)
                .border(.black, width: 1)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .shadow(color: .gray, radius: 1, x: 1, y: 1)
        )
        
        Rectangle()
            .frame(width: UIScreen.main.bounds.width, height: 10)
            .foregroundStyle(Color.bgColor)
    }
}
