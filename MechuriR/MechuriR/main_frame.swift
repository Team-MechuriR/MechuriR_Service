//
//  main_frame.swift
//  MechuriR
//
//  Created by 황민채 on 2023/10/14.
//메인페이지

import SwiftUI

struct main_frame: View {
    var body: some View {
        ZStack{
            Color("bg_color").ignoresSafeArea()
            VStack{
                HStack{
                    Image("mechuri1")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                }
            }
        }
    }
}

struct main_frame_Previews: PreviewProvider {
    static var previews: some View {
        main_frame()
    }
}
