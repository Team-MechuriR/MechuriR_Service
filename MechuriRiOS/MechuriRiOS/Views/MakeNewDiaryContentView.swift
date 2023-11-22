//
//  MakeNewDiaryContentView.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/21/23.
//

import SwiftUI

struct MakeNewDiaryContentView: View {
    private var deviceSize: CGRect {
        return UIScreen.main.bounds
    }
    @State var diaryContentName: String = ""
    var body: some View {
        ZStack{
            Color("bgColor").ignoresSafeArea()
            
            VStack {
                Image("mechuri1")
                    .resizable()
                    .frame(width: 30,height: 30)
            }
            VStack {
                HStack {
                    
                    Button{
                        
                    }label: {
                        Image(systemName: "xmark")
                            .fontWeight(.heavy)
                            .padding(15)
                            .foregroundStyle(Color.fontColor)
                    }
                    
                    Spacer()
                    
                    Text("일기 쓰기") // 최대 글자갯수 제한 필요
                        .font(.Cafe2418)
                        .foregroundStyle(Color.fontColor)
                        .bold()
                        .padding(7)
                    
                    Spacer()
                    
                    Button{
                        
                    }label: {
                        Image(systemName: "checkmark")
                            .fontWeight(.heavy)
                            .padding(15)
                            .foregroundStyle(Color.fontColor)
                    }
                }
                .background(Rectangle()
                    .fill(Color.btnColor)
                    .frame(width: deviceSize.width, height: 40)
                )
                TextField("제목", text: $diaryContentName)
                    .padding(5)
                //.background(Color.white)
                    .foregroundStyle(Color.btnColor)
                    .font(.Cafe2418)
                //.border(Color.btnColor)
                //.padding(.top, -12)
            }.background(Color.white)
        }
    }
}

#Preview {
    MakeNewDiaryContentView()
}
