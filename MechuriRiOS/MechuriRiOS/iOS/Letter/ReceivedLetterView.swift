//
//  ReceivedLetterView.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/16/23.
//

import SwiftUI

struct ReceiveLetters: Identifiable {
    var id = UUID()
    var letter: String
    var state: String
    var stateColor: Color
}

struct ReceivedLetterView: View {
    private var deviceSize: CGRect {
        return UIScreen.main.bounds
    }
    
    var receiveLetters: [ReceiveLetters] = [
        ReceiveLetters(letter: "이것참", state: "전달대기", stateColor: Color.btnColor),
        ReceiveLetters(letter: "어렵네", state: "전달대기", stateColor: Color.btnColor),
        ReceiveLetters(letter: "언제 다 할라나", state: "전달대기", stateColor: Color.btnColor),
        ReceiveLetters(letter: "후우우우우", state: "전달완료", stateColor: Color.fontColor)
    ]
    
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea()
            
            VStack{
                VStack {
                    Image("mechuri1")
                        .resizable()
                        .frame(width: 30,height: 30)
                }
                .frame(height: 40)
                HStack{
                    
                    Spacer()
                    
                    Text("받은 편지")
                        .font(.Cafe2418)
                        .foregroundStyle(Color.fontColor)
                        .bold()
                        .padding(7)
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 10)//갈색 상단바
                .background(Rectangle()
                    .fill(Color.btnColor)
                    .frame(height: 40)
                )
                
                NavigationStack {
                    
                    List {
                        
                        ForEach(receiveLetters) { item in
                            NavigationLink(destination: receiveLetterDetailView(message: item.letter)) {
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
                Spacer() // 아예 위에 딱 붙이는 방법은 없나?
                
            }
        }
        .frame(width: getRect().width, alignment: .leading)
    }
}

struct receiveLetterDetailView: View {
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
