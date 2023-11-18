//
//  extensions.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/16/23.
//

import SwiftUI

extension Color {
    static let bgColor = Color("bgColor")
    static let btnColor = Color("btnColor")
    static let kakaoColor = Color("kakaoColor")
    static let naverColor = Color("naverColor")
    static let sideViewColor = Color("sideViewColor")
    static let borderColor = Color("borderColor")
    static let nameColor = Color("nameColor")
    static let fontColor = Color("fontColor")
}


extension View { // 빈 뷰를 터치했을 때 키보드가 내려가도록 하는 extension 구현
    func endTextEditing() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil, from: nil, for: nil
        )
    }
}
