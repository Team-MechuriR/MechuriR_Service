//
//  ContentView.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/3/23.
//

import SwiftUI

/*MVS(스토어) ? :
 객체를 나누는 기준을
 
 state object : 스토어(옵저버블 채택) 객체의 출발시점 // 다른 뷰에서는 environment Object <- 
 */

struct ContentView: View {
    var body: some View {
        MainFrameView()
        
        //유저정보가 있으면 메인프레임 -> environment object 에 유저정보를 요청하는 함수를 구현
        //없으면 로그인뷰
        //.task { 네트워크 요청 } 분기 ????
        
    }
}

#Preview {
    ContentView()
}
