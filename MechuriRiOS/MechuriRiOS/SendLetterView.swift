//
//  SendLetterView.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/16/23.
//

import SwiftUI
struct SendLetterAndState: Identifiable {
    var id = UUID()
    var letter: String
    var state: String
    var stateColor: Color // 여기에 편지 제목하고 내용 분리하여 구성------
}
struct SendLetterView: View {
    private var deviceSize: CGRect {
        return UIScreen.main.bounds
    }
    var sendLetterItems: [SendLetterAndState] = [
        SendLetterAndState(letter: "이것참", state: "전달대기", stateColor: Color.btnColor),
        SendLetterAndState(letter: "어렵네", state: "전달대기", stateColor: Color.btnColor),
        SendLetterAndState(letter: "언제 다 할라나", state: "전달대기", stateColor: Color.btnColor),
        SendLetterAndState(letter: "후우우우우", state: "전달완료", stateColor: Color.fontColor)
    ]
    @State private var stateColor: Color = Color.btnColor
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea()
            
            VStack{
                Image("mechuri1")
                    .resizable()
                    .frame(width: 30,height: 30)
                
                HStack{
                    
                    Spacer()
                    
                    Text("보낸 편지")
                        .font(.title3)
                        .foregroundStyle(Color.fontColor)
                        .bold()
                        .padding(7)
                    
                    Spacer()
                    
                }
                .background(Rectangle()
                    .fill(Color.btnColor)
                    .frame(width: deviceSize.width, height: 40)
                )
                NavigationStack{
                    
                    List {
                        
                        ForEach(sendLetterItems) { item in
                            NavigationLink(destination: DetailsView(message: item.letter)) {
                                HStack {
                                    Image(systemName: "envelope")
                                    Text(item.letter)
                                    
                                    Spacer()
                                    
                                    Text(item.state)
                                        .padding(3)
                                        .background(item.stateColor)
                                        .foregroundStyle(Color.white)
                                }
                            }
                        }
                    }.listStyle(.plain)
                }
            }
        }
        .frame(width: getRect().width, alignment: .leading)
    }
}

struct DetailsView: View {
    let message: String
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading) {
                Text("제목: \(message)")
                Divider()
                Text(message)
                Divider()
                Text("전달까지 D-39 남았습니다.") // 변수 만들기
                Spacer()
            }.padding()
        }
        .background(Color.bgColor)
    }
}
#Preview {
    SendLetterView()
}
