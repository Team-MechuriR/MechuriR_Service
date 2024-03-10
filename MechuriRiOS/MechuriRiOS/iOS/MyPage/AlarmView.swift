//
//  AlarmView.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/16/23.
//

import SwiftUI
import Alamofire

struct AlarmView: View {
    @Environment(\.dismiss) var dismiss
    
    private var deviceSize: CGRect {
        return UIScreen.main.bounds
    }
    @State private var data: [Notice] = []
    
    func loadData() async {
        // 기본 URL
        let baseUrl = "http://220.74.97.228:8081/api/notice/get/type"
        
        // 쿼리 파라미터를 포함한 전체 URL 구성
        // name 파라미터의 값을 URL 인코딩
//        guard let nameEncoded = "박수현".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        let parameters: [String: Any] = [
            "name": "박수현",
            "page": 0,
            "type": "create"
        ]
        
        // Alamofire를 사용하여 요청
        do {
            let response: NoticesResponse = try await AF.request(baseUrl, method: .get, parameters: parameters)
                .serializingDecodable(NoticesResponse.self)
                .value
            print(response)
            self.data = response.content
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea()
            
            VStack{
                Image("mechuri1") //로고 이미지
                    .resizable()
                    .frame(width: 30,height: 30)
                
                HStack{
                    Spacer()
                    
                    Text("알림")
                        .font(.Cafe2418)
                        .foregroundStyle(Color.fontColor)
                    
                    Spacer()
                }
                .padding(.horizontal, 10)//갈색 상단바
                .background(Rectangle()
                    .fill(Color.btnColor)
                    .frame(height: 40)
                )
                List {
                    ForEach(data, id: \.self.noticeId) { notice in
                        NavigationLink {
                            AlarmDetailView()
                        } label: {
                            HStack {
                                Text(notice.content)
                                    .font(.Cafe2414)
                                
                                Spacer()
                                
                                Image(systemName: "paperplane")
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .background(Color.bgColor)
                .scrollContentBackground(.hidden)
                .navigationBarBackButtonHidden()
            } //상단 탭바
        }
        .onAppear {
            Task {
                await loadData()
                print("됐나")
            }
        }
    }
}

struct AlarmDetailView: View {
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea()
            
            VStack {
                Text("대강 알림 내용")
            }
            .navigationBarBackButtonHidden()
        }
    }
}
