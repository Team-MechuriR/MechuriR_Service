//
//  UserData.swift
//  KaKao_Login
//
//  Created by 강치우 on 11/22/23.
//

import Foundation

var userNameID: String {
    get {
        UserDefaults.standard.string(forKey: "userNameID") ?? ""
    }
    set {
        UserDefaults.standard.set(newValue, forKey: "userNameID")
    }
}

struct UserData {
    var url: URL? // 이미지 없을수도
    var userId: String
    var userPw: String
    var email: String
    var userName: String
    var userBirth: String
    var userPhone: String
    var userEmail: String
    var isAd: String
    
    init(url: URL? = nil, 
         userId: String,
         userPw: String,
         email: String,
         userName: String,
         userBirth: String,
         userPhone: String,
         userEmail: String,
         isAd: String) 
    {
        self.url = url
        self.userId = userId
        self.userPw = userPw
        self.email = email
        self.userName = userName
        self.userBirth = userBirth
        self.userPhone = userPhone
        self.userEmail = userEmail
        self.isAd = isAd
    }
}


