//
//  MakeNewDiaryView.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/18/23.
//

import SwiftUI

struct MakeNewDiaryView: View {
    @State private var diaryName: String = "".precomposedStringWithCanonicalMapping
    @State private var selectedDate = Date()
    @State private var selectedColor: Color = Color.teal
    @FocusState var focusField: Bool
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            
            VStack {
                
                HStack {
                    
                    Button{
                        isPresented.toggle()
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
                    .frame(height: 40)
                )
                
                VStack {
                    VStack {
                        TextField(text: $diaryName, prompt: Text("일기장 이름을 입력하세요.")
                            .font(.Cafe2418)
                            .foregroundStyle(Color.emptyFontColor),
                                  label: {})
                        .padding(.horizontal, 15)
                        .foregroundStyle(Color.fontColor)
                        .font(.Cafe2418) //텍스트 썼을 경우에
                    }
                    .frame(height: 35)
                    
                    Divider()
                        .frame(height: 2)
                        .background(Color.deviderColor)
                    
                    
                    // 2
                    HStack {
                        DatePicker("날짜", selection: $selectedDate)
                            .font(.Cafe2418)
                            .foregroundStyle(Color.fontColor)
                            .padding(.leading, 10)
                    }
                    Divider()
                        .frame(height: 2)
                        .background(Color.deviderColor)
                    
                    // 3
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

