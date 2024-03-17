//
//  WriteLetterView.swift
//  MechuriRiOS
//
//  Created by 황민채 on 3/10/24.
//

import SwiftUI
import PhotosUI

struct WriteLetterView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var width = UIScreen.main.bounds.width
    @State var height = UIScreen.main.bounds.height
    //    @Binding var isPresentNewContent: Bool
    
    @State private var isPresentLetterPopup: Bool = false // 편지쓰기 모달
    
    @State private var diaryContentName: String = ""
    @State private var diaryContent: String = ""
    @State private var selectMonth: SelectMonth = .sixMonth
    
    @State private var selectedImages: [PhotosPickerItem] = []
    @State private var selectedImageData: Data?
    
    var body: some View {
        ZStack{
            Color("bgColor").ignoresSafeArea()
            VStack {
                VStack {
                    Image("mechuri1")
                        .resizable()
                        .frame(width: 30,height: 30)
                }
                .frame(height: 40)
                
                VStack {
                    HStack {
                        Button{
                            dismiss()
                        }label: {
                            Image(systemName: "xmark")
                                .fontWeight(.heavy)
                                .padding(15)
                                .foregroundStyle(Color.fontColor)
                        }
                        
                        Spacer()
                        
                        Text("편지 쓰기") // 최대 글자갯수 제한 필요
                            .font(.Cafe2418)
                            .foregroundStyle(Color.fontColor)
                            .bold()
                            .padding(7)
                        
                        Spacer()
                        
                        Button{
                            isPresentLetterPopup.toggle()
                        }label: {
                            Image(systemName: "paperplane.fill")
                                .fontWeight(.heavy)
                                .padding(15)
                                .foregroundStyle(Color.fontColor)
                        }
                    }
                    .padding(.horizontal, 10)//갈색 상단바
                    .background(Rectangle()
                        .fill(Color.btnColor)
                        .frame(height: 40)
                    )
                    
                    TextField(text: $diaryContentName,
                              prompt: Text("제목")
                        .font(.Cafe2418)
                        .foregroundStyle(Color.btnColor),
                              label: {})
                    .padding(.horizontal, 15)
                    .foregroundStyle(Color.btnColor)
                    .font(.Cafe2418)
                    
                    NewContentDivider()
                    
                    VStack {
                        TextField(text: $diaryContent,
                                  prompt: Text(
                                    "내용을 입력해주세요 (20자 이내)")
                                    .font(.Cafe2418)
                                    .foregroundStyle(Color.btnColor),
                                  axis: .vertical,
                                  label: {})
                        .font(.Cafe2418)
                        .foregroundStyle(Color.fontColor)
                        Spacer()
                    }
                    .frame(height: 200)
                    .padding(.horizontal, 15)
                    
                    NewContentDivider()
                    
                    HStack {
                        HStack {
                            Image(systemName: "photo")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(Color.fontColor)
                            
                            Text("사진 추가")
                                .font(.Cafe2418)
                                .foregroundStyle(Color.btnColor)
                        }
                        
                        Spacer()
                        
                        PhotosPicker(selection: $selectedImages,
                                     matching: .any(of: [.images, .not(.livePhotos)]) ,
                                     photoLibrary: .shared()) {
                            
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(Color.fontColor)
                        }
                                     .onChange(of: selectedImages) {
                                         print(selectedImages)
                                     }
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
                    
                    
                    NewContentDivider()
                    
                    HStack {
                        HStack {
                            Image(systemName: "calendar.badge.plus")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(Color.fontColor)
                            Text("전달 시기")
                                .font(.Cafe2418)
                                .foregroundStyle(Color.fontColor)
                                .bold()
                        }
                        Spacer()
                        // circle
                        // circle.inset.filled
                        HStack {
                            Image(systemName: selectMonth == .oneMonth ? "circle.inset.filled" : "circle")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text(SelectMonth.oneMonth.rawValue)
                                .font(.Cafe2418)
                        }
                        .foregroundStyle(selectMonth == .oneMonth ? Color.fontColor : Color.btnColor)
                        .onTapGesture {
                            selectMonth = .oneMonth
                        }
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: selectMonth == .sixMonth ? "circle.inset.filled" : "circle")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text(SelectMonth.sixMonth.rawValue)
                                .font(.Cafe2418)
                        }
                        .foregroundStyle(selectMonth == .sixMonth ? Color.fontColor : Color.btnColor)
                        .onTapGesture {
                            selectMonth = .sixMonth
                        }
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: selectMonth == .oneYear ? "circle.inset.filled" : "circle")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text(SelectMonth.oneYear.rawValue)
                                .font(.Cafe2418)
                        }
                        .foregroundStyle(selectMonth == .oneYear ? Color.fontColor : Color.btnColor)
                        .onTapGesture {
                            selectMonth = .oneYear
                        }
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
                }
                .background(Color.white)
                .navigationBarBackButtonHidden()
                
                NewContentDivider()
                
                Spacer()
                
            }
            
        }
        .sheet(isPresented: $isPresentLetterPopup) {
            VStack {
                Text("6개월 후에 편지를 보내드릴게요:>")
                    .font(.Cafe2418)
                    .font(.subheadline)
                    .padding(30)
                
                NewContentDivider()
                
                Button {
                    Task {
                        await sendToServer(title: diaryContentName,
                                           content: diaryContent,
                                           photo: selectedImages,
                                           atTime: selectMonth.rawValue)
                    }
                    
                    dismiss()
                    
                } label: {
                    Text("확인")
                        .frame(maxWidth: .infinity)
                        .font(.Cafe24Air18)
                        .font(.subheadline)
                        .foregroundStyle(Color.fontColor)
                }
                .padding(.bottom, 10)
            }
            .frame(width: width * 0.9)
            .background(Color.white)
            .clipShape(.rect(cornerRadius: 12))
            .padding(.horizontal)
            .background(ClearBackground())
        }
    }
    func sendToServer(title: String, content: String, photo: [PhotosPickerItem], atTime: String) async {
        // api 서버로직
        // photo 추가
        print(photo)
        print(title)
    }
}
