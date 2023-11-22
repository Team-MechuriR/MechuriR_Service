//
//  AlarmView.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/16/23.
//

import SwiftUI

struct AlarmView: View {
    private var deviceSize: CGRect {
        return UIScreen.main.bounds
    }
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea()
            
            VStack{
                Image("mechuri1")
                    .resizable()
                    .frame(width: 30,height: 30)
                
                HStack{
                    
                    Spacer()
                    
                    Text("알림")
                        .font(.Cafe2418)
                        .foregroundStyle(Color.fontColor)
                        .bold()
                        .padding(7)
                    
                    Spacer()
                    
                }
                .background(Rectangle()
                    .fill(Color.btnColor)
                    .frame(width: deviceSize.width, height: 40)
                )
                
                Spacer() // 아예 위에 딱 붙이는 방법은 없나?
                
            }
        }
        .frame(width: getRect().width, alignment: .leading)
    }
}

#Preview {
    AlarmView()
}
