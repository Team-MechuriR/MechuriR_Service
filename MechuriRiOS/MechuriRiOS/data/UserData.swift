//
//  UserData.swift
//  KaKao_Login
//
//  Created by 강치우 on 11/22/23.
//

import Foundation

// 구글관련 임시 뷰 유저데이터 받아오는 userdata 나중에 지워도 됨.
struct UserData {
    let url: URL?
    let name: String
    let email: String
    
    init(url: URL?, name: String, email: String) {
        self.url = url
        self.name = name
        self.email = email
    }
}
