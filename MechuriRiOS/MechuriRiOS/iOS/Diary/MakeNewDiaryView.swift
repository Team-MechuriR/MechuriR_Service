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
    @State private var selectedPlace = ""
    @State private var writeDescription = ""
    @State private var selectedColor: Color = Color.teal
    @State private var selectMembers = ""
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
                        Image("placeIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(Color.fontColor)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 5)
                        TextField(text: $selectedPlace, prompt: Text("장소")
                            .font(.Cafe2418)
                            .foregroundStyle(Color.emptyFontColor),
                                  label: {})
                        .foregroundStyle(Color.fontColor)
                        .font(.Cafe2418) //텍스트 썼을 경우에
                    }
                    
                    Divider()
                        .frame(height: 2)
                        .background(Color.deviderColor)

                    // 4
                    HStack {
                        Image("descriptionIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(Color.fontColor)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 5)
                        TextField(text: $writeDescription, prompt: Text("설명")
                            .font(.Cafe2418)
                            .foregroundStyle(Color.emptyFontColor),
                                  label: {})
                        .foregroundStyle(Color.fontColor)
                        .font(.Cafe2418) //텍스트 썼을 경우에
                    }
                    Divider()
                        .frame(height: 2)
                        .background(Color.deviderColor)

                    // 5
                    HStack {
                        Image("colorIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color.fontColor)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)

                        ColorPicker("색상", selection: $selectedColor)
                            .font(.Cafe2418)
                            .foregroundStyle(Color.emptyFontColor)
                    }
                    Divider()
                        .frame(height: 2)
                        .background(Color.deviderColor)
                    
                    // 6
                    HStack {
                        Image("membersIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .foregroundStyle(Color.fontColor)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)
                        TextField(text: $selectMembers, prompt: Text("멤버")
                            .font(.Cafe2418)
                            .foregroundStyle(Color.emptyFontColor),
                                  label: {})
                        .foregroundStyle(Color.fontColor)
                        .font(.Cafe2418) //텍스트 썼을 경우에
                        
                        Button {
                            // 친구 추가
                        } label: {
                            Image(systemName: "plus")
                                .fontWeight(.heavy)
                                .foregroundStyle(Color.fontColor)
                                .padding(.horizontal, 15)
                            .padding(.vertical, 5)                }
                        
                    }
                    Divider()
                        .frame(height: 2)
                        .background(Color.deviderColor)
                } // List
                .listRowSpacing(2)
                .scrollContentBackground(.hidden) // 이게 있어야 리스트 백그라운드 컬러 수정 가능함
                .background(Color.bgColor)
            }
        }
        .background(Color.bgColor)
    }
}

