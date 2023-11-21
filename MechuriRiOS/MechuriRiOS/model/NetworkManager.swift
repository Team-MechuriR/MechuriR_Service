//
//  NetworkManager.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/20/23.
//

// 1. 비동기처리
// 2. api 변수처리하는거

import Foundation

enum NetworkError {
    case badConnection
    case invalidResponse
    case invalidData
    
    var errorMessage: String {
        switch self {
            
        case .badConnection:
            return "We got some error. check internet"
        case .invalidResponse:
            return "Invalid response"
        case .invalidData:
            return "Invalid data"
        }
    }
}
enum MyResult {
    case success(data: GetExDiary)
    case failure(error: NetworkError)
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() { }
    
    func requestExDiary(completed: @escaping (MyResult) -> ()) {
        var request = URLRequest(url: URL(string: "http://220.74.97.228:8081/api/ex_diary/1")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let _ = error {
                completed(.failure(error: .badConnection))
            } // task 에 urlsession을 받고 핸들러에 저 세개를 가져옴 //에러 검증 1
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(error: .invalidResponse))
                return //에러 검증 2
            }
            
            guard let data = data else {
                completed(.failure(error: .invalidData))
                return //에러 검증 3
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(GetExDiary.self, from: data)
                
                completed(.success(data: decodedResponse)) // 여기에 태워보냄
                
            } catch {
                print(error)
            }
        }
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
