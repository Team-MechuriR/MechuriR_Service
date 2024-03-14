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
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea()
            
            VStack{
                Image("mechuri1")
                    .resizable()
                    .frame(width: 30,height: 30)
                
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
                
                Image("sampleProfileImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.btnColor, lineWidth: 5))
                //.shadow(color: .gray, radius: 2)
                    .frame(width: 170, height: 170)
                    .padding(30)
                HStack{
                    Spacer()
                    TextField("[username]", text: $changedName) //버튼 클릭식으로 바뀌어야 함
                        .submitLabel(.done)
                        .onSubmit {
                            //validate(name: $changedName) -> 함수구현 필요
                        }
                        
                    Spacer()
                }
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
                
                HStack{
                    
                    Spacer()
                    
                    Text("친구 추가 코드")
                    Spacer()
                    Text("데이터 바인딩 될 무언가") // 복사기능까지
                    
                    Spacer()
                    
                }
                
                Spacer() // 아예 위에 딱 붙이는 방법은 없나?
            }
        }
        .frame(width: getRect().width, alignment: .leading)
        .onTapGesture{
            self.endTextEditing()
        }
    }
}
