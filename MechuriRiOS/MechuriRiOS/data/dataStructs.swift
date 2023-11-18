//
//  dataStructs.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/18/23.
//


import Foundation

final class ExDiarytTask: ObservableObject {
    
    static let shared: ExDiarytTask = ExDiarytTask() //타입 프로퍼티(인스턴스 초기화 없이 쓸 수 있음)
    private init() { }
    
    func ExDiarystartTask() async {
        
        let parameters = "{\r\n    \"startDate\": \"2023-08-11T07:50:03\",\r\n    \"finishDate\": \"2023-08-11T07:50:03\",\r\n    \"exDiaryName\": \"모임\",\r\n    \"createMemberName\": \"박수현\"\r\n}"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "http://localhost:8080/api/ex_diary")!,timeoutInterval: Double.infinity)
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
    }
    
    
    func ExDiaryGetExDiary() async {
        var request = URLRequest(url: URL(string: "http://localhost:8080/api/ex_diary/search?id=1%2C3")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
    }
}
