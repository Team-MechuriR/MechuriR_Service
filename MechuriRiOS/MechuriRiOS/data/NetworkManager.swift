//
//  NetworkManager.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/20/23.
//

import SwiftUI

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() { }
    
    func requestExDiary(completed: @escaping (GetExDiary?, String?) -> ()) {
        
    }
    func requestTeamMember(completed: @escaping (GetTeamMember?, String?) -> ()) {
        
    }
    func requestDiary(completed: @escaping (GetDiary?, String?) -> ()) {
        
    }
    func requestComment(completed: @escaping (GetComment?, String?) -> ()) {
        
    }
    func requestSingleNotice(completed: @escaping (GetSingleNotice?, String?) -> ()) {
        
    }
    
}
