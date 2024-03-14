//
//  MyPageView.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/16/23.
//

import SwiftUI

struct MyPageView: View {
    private var deviceSize: CGRect {
        return UIScreen.main.bounds
    }
    @State var changedName: String = ""
    @State var output: String = "" // 임시
    @State var addFriendCode: String = ""
    
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea()
            
            VStack{
                Image("mechuri1")
                    .resizable()
                    .frame(width: 30,height: 30)
                
                // MARK: - TopCell
                HStack{
                    Button{
                        // TODO: - xmark
                    } label: {
                        Image(systemName: "xmark")
                            .fontWeight(.heavy)
                            .padding(15)
                            .foregroundStyle(Color.fontColor)
                    }
                    
                    Spacer()
                    
                    Text("마이페이지")
                        .font(.Cafe2418)
                        .foregroundStyle(Color.fontColor)
                        .padding(7)
                    
                    Spacer()
                    
                    Button{
                        // TODO: - checkmark, save
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
                
                // image
                Image("sampleProfileImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.btnColor,
                                    lineWidth: 5))
                //.shadow(color: .gray, radius: 2)
                    .frame(width: 180, height: 180)
                    .padding(20)
                
                // MARK: - [username]
                HStack{
                    
                    Spacer()
                    
                    TextField("[username]", text: $changedName)
                        .frame(width: 120)
                        .font(.Cafe2418)
                        .foregroundColor(Color.fontColor)
                        .bold()
//                        .submitLabel(.done)
//                        .onSubmit {
//                            //validate(name: $changedName) -> 함수구현 필요
//                        }
                    
                    Button {
                        // TODO: 수정 버튼 누르면 수정되게
                    } label: {
                        Image(systemName: "pencil")
                            .foregroundColor(Color.emptyFontColor)
                            .fontWeight(.heavy)
                    }

                        
                    Spacer()
                }
                .padding(5)
                //예시
//                .onChange(of: changedName) { (oldValue, newValue) in
//                    Task {
//                        let result = try! await
//                        
//                        output = result
//                    }
//                }
                //예시
                Divider()
                    .frame(width: deviceSize.width, height: 3)
                    .background(Color.btnColor)
                
                // MARK: - [친구 추가 코드]
                HStack{
                    
                    Spacer()
                    
                    Text("친구 추가 코드")
                        .font(.Cafe2418)
                        .foregroundColor(Color.fontColor)
                    
                    Spacer()
                    
                    TextField("친구의 코드", text: $addFriendCode)
                        .frame(width: 120)
                        .font(.Cafe2418)
                        .foregroundColor(Color.fontColor)
                    // 복사기능까지
                    
                    Button {
                        // TODO : 복사하는 기능 넣기
                    } label: {
                        Image(systemName: "square.on.square")
                            .foregroundStyle(Color.emptyFontColor)
                            .fontWeight(.heavy)
                        
                    }

                    Spacer()
                    
                }
                
                Spacer() // 아예 위에 딱 붙이는 방법은 없나?
            }
        }
        .background(Color.white)
        .frame(width: getRect().width, alignment: .leading)
        
        .onTapGesture{
            self.endTextEditing()
        }
    }
}
