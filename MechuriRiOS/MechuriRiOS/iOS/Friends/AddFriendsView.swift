//
//  AddFriendsView.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/16/23.
//

import SwiftUI
import Alamofire

struct AddFriendsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var searchText = "" // 검색어를 저장할 변수
    
    private var deviceSize: CGRect {
        return UIScreen.main.bounds
    }
    
    
    @State private var dataExample: [TeamMember] = [] // 초기 상태는 비어있는 배열
    
    //    func loadData() {
    //        let urlString = "http://localhost:8080/api/mate/searchMate?userId=박수현"
    //        
    //        Alamofire.request(urlString, method: .get).responseDecodable(of: [TeamMember].self) { response in
    //            guard let members = response.value else { return }
    //            self.dataExample = members
    //        }
    //    }
    
    var filteredMembers: [TeamMember] {
        if searchText.isEmpty {
            return dataExample
        } else {
            return dataExample.filter { $0.memberName.contains(searchText) }
        }
    }
    
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea()
            
            VStack{
                VStack {
                    Image("mechuri1") //로고 이미지
                        .resizable()
                        .frame(width: 30,height: 30)
                }
                .frame(height: 40)
                
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(Color.btnColor)
                            .font(.title3)
                            .fontWeight(.heavy)
                    }
                    
                    Spacer()
                    
                    Text("친구 추가")
                        .font(.Cafe2418)
                        .foregroundStyle(Color.fontColor)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "person.badge.plus")
                            .foregroundStyle(Color.btnColor)
                            .font(.title3)
                            .fontWeight(.heavy)
                    }
                }
                .padding(.horizontal, 10)//갈색 상단바
                .background(Rectangle()
                    .fill(Color.btnColor)
                    .frame(height: 40)
                )
                
                TextField("친구 검색...", text: $searchText)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal, 10)
                    .onSubmit {
                        // 검색 실행 시 필요한 로직 (옵션)
                    }
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 15)
                            
                            if !searchText.isEmpty {
                                Button(action: {
                                    searchText = ""
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 15)
                                }
                            }
                        }
                    )
                List(filteredMembers, id: \.self.memberId) { teamMember in
                    HStack {
                        Text(teamMember.memberName)
                            .font(.Cafe2414)
                        
                        Spacer()
                        
                        Button {
                            print("친구추가!!!!1")
                        } label: {
                            Image("addFriendButton")
                        }
                    }
                }
                .listRowSpacing(10)
                .background(Color.bgColor)
                .scrollContentBackground(.hidden)
                .navigationBarBackButtonHidden()
            } //상단 탭바
        }
        //.onAppear(perform: loadData)
    }
}

