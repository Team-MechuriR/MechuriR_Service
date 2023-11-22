//
//  MakeNewDiaryContentView.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/21/23.
//

import SwiftUI
import PhotosUI

enum DiaryType: String {
	case diary = "일기"
	case letter = "편지"
}

enum SelectMonth: String {
	case oneMonth = "1개월"
	case sixMonth = "6개월"
	case oneYear = "1년"
}

struct MakeNewDiaryContentView: View {
	
    private var deviceSize: CGRect {
        return UIScreen.main.bounds
    }
	
	let diaryType: DiaryType
	
//	@Binding var isPresentNewContent: Bool
	
	@State private var isPresentPopup: Bool = false
	
    @State private var diaryContentName: String = ""
	@State private var diaryContent: String = ""
	@State private var selectMonth: SelectMonth = .sixMonth
	
	@State private var selectedImages: [PhotosPickerItem] = []
	@State private var selectedImageData: Data?
	
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
//						isPresentNewContent.toggle()
                    }label: {
                        Image(systemName: "xmark")
                            .fontWeight(.heavy)
                            .padding(15)
                            .foregroundStyle(Color.fontColor)
                    }
                    
                    Spacer()
                    
					Text("\(diaryType.rawValue) 쓰기") // 최대 글자갯수 제한 필요
                        .font(.Cafe2418)
                        .foregroundStyle(Color.fontColor)
                        .bold()
                        .padding(7)
                    
                    Spacer()
                    
                    Button{
						isPresentPopup.toggle()
                    }label: {
						Image(systemName: diaryType == .diary ? "checkmark" : "paperplane.fill")
                            .fontWeight(.heavy)
                            .padding(15)
                            .foregroundStyle(Color.fontColor)
                    }
                }
                .background(Rectangle()
                    .fill(Color.btnColor)
                    .frame(width: deviceSize.width, height: 40)
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
								"내용을 입력해주세요 (XX자 이내)")
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
				
				if diaryType == .letter {
					
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
				
				NewContentDivider()
				
            } // end VStack
			.background(Color.white)
			if(isPresentPopup){
				VStack{
					CustomAlert(isPresentPopup: $isPresentPopup)
						.padding(.horizontal)
				}
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				.background(Color.black.opacity(0.5))
				.edgesIgnoringSafeArea(.all)
			}
		}
    }
}

struct NewContentDivider: View {
	var body: some View {
		Divider()
			.frame(height: 3)
			.background(Color.btnColor)
	}
}

#Preview {
	MakeNewDiaryContentView(diaryType: .letter)
}
