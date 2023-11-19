//
//  MakeNewDiaryView.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/18/23.
//

import SwiftUI

struct MakeNewDiaryView: View {
    private var deviceSize: CGRect {
        return UIScreen.main.bounds
    }
    @State private var diaryName: String = "".precomposedStringWithCanonicalMapping
    @State private var selectedDate = Date()
    @State private var selectedColor: Color = Color.teal
    @FocusState var focusField: Bool
    var body: some View {
        ZStack {
            
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
                    
                    Text("일기장 생성") // 최대 글자갯수 제한 필요
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
                
                List {
                    
                    TextField("일기장 이름을 입력하세요.", text: $diaryName)
                    
                        .padding(.leading, 10)
                        .keyboardType(.default)
        
                    DatePicker("날짜", selection: $selectedDate)
                        .padding(.leading, 10)
                    
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                        Text("장소")
                    }
                    .padding(.leading, 10)
                    
                    
                    HStack {
                        Image(systemName: "doc.plaintext")
                        Text("설명")
                    }
                    .padding(.leading, 10)
                    
                    
                    HStack {
                        Image(systemName: "paintpalette")
                        ColorPicker("색상", selection: $selectedColor)
                    }
                    .padding(.leading, 10)
                    
                    HStack {
                        Image(systemName: "person.3")
                        Text("멤버")
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    .padding(.leading, 1)
                    
                } // List
                .listRowSpacing(2)
                .scrollContentBackground(.hidden) // 이게 있어야 리스트 백그라운드 컬러 수정 가능함
                .background(Color.bgColor)
            }
        }
        .background(Color.bgColor)
    }
}


#Preview {
    MakeNewDiaryView()
}
