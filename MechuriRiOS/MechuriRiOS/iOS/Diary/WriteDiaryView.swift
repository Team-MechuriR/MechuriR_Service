//
//  WriteDiaryView.swift
//  MechuriRiOS
//
//  Created by 황민채 on 3/10/24.
//

import SwiftUI
import PhotosUI

struct WriteDiaryView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var width = UIScreen.main.bounds.width
    @State var height = UIScreen.main.bounds.height
    
    @State private var isPresentDiaryPopup: Bool = false // 일기쓰기 모달
    
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
                } // 프레임
                
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
                        
                        Text("일기 쓰기") // 최대 글자갯수 제한 필요
                            .font(.Cafe2418)
                            .foregroundStyle(Color.fontColor)
                            .bold()
                            .padding(7)
                        
                        Spacer()
                        
                        Button{
                            isPresentDiaryPopup.toggle()
                        }label: {
                            Image(systemName: "checkmark")
                                .fontWeight(.heavy)
                                .padding(15)
                                .foregroundStyle(Color.fontColor)
                        }
                    }
                    .background(Rectangle()
                        .fill(Color.btnColor)
                        .frame(width: width, height: 40)
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
                    
                } // end VStack
                .background(Color.white)
                .navigationBarBackButtonHidden()
                
                NewContentDivider()
                
                Spacer()
                
            }
            
        }
        .sheet(isPresented: $isPresentDiaryPopup) {
            VStack {
                VStack {
                    Text("일기를 쓰시겠어요?")
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
                            .font(.Cafe2418)
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
    }
    func sendToServer(title: String, content: String, photo: [PhotosPickerItem], atTime: String) async {
        // api 서버로직
        // photo 추가
        print(photo)
        print(title)
    }
}
