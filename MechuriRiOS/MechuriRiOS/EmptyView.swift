//
//  EmptyView.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/19/23.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        ZStack{
            Color("bgColor").ignoresSafeArea()
        }
    }
}

#Preview {
    EmptyView()
}
