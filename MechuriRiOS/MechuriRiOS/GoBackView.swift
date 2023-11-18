//
//  GoBackView.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/16/23.
//

import SwiftUI

struct GoBackView: View {
    private var deviceSize: CGRect {
        return UIScreen.main.bounds
    }
    var body: some View {
        ZStack{
            VStack{
                
            }
            .overlay{
                Button{
                    
                }label: {
                    Image(systemName: "xmark")
                        .fontWeight(.heavy)
                        .padding(15)
                        .foregroundStyle(Color.fontColor)
                }
                .offset(CGSize(width: -deviceSize.width / 2 + 25, height: -deviceSize.height/2 + 102))
            }
        }
    }
}

#Preview {
    GoBackView()
}
