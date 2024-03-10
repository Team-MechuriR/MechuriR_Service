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
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack{
            VStack{
                
            }
            .overlay{
                Button{
                    presentationMode.wrappedValue.dismiss()
                }label: {
                    Image(systemName: "xmark")
                        .fontWeight(.heavy)
                        .padding(15)
                        .foregroundStyle(Color.fontColor)
                }
                .offset(CGSize(width: -deviceSize.width / 2 + 25, height: -deviceSize.height/2 + 102))
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}
