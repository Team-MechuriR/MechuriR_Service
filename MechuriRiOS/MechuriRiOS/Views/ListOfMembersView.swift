//
//  ListOfMemberView.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/22/23.
//

import SwiftUI

//(민채)
//MARK: 친구목록뷰

struct ListOfMembersView: View {
    private var deviceSize: CGRect {
        return UIScreen.main.bounds
    }
    var dataExample = [
        TeamMember(memberId: 1,
                   exDiaryId: 1,
                   memberName: "원태",
                   createdDate: "2023-10-17T15:01:21.896289",
                   modifiedDate: "2023-10-17T15:01:21.896289",
                   status: "T"),
        
        TeamMember(memberId: 2,
                   exDiaryId: 1,
                   memberName: "만재",
                   createdDate: "2023-10-17T15:01:21.896289",
                   modifiedDate: "2023-10-17T15:01:21.896289",
                   status: "T"),
        
        TeamMember(memberId: 3,
                   exDiaryId: 1,
                   memberName: "주young",
                   createdDate: "2023-10-17T15:01:21.896289",
                   modifiedDate: "2023-10-17T15:01:21.896289",
                   status: "T"),
        
        TeamMember(memberId: 4,
                   exDiaryId: 1,
                   memberName: "츄",
                   createdDate: "2023-10-17T15:01:21.896289",
                   modifiedDate: "2023-10-17T15:01:21.896289",
                   status: "T"),
        
        TeamMember(memberId: 5,
                   exDiaryId: 1,
                   memberName: "팡",
                   createdDate: "2023-10-17T15:01:21.896289",
                   modifiedDate: "2023-10-17T15:01:21.896289",
                   status: "T"),
        
        TeamMember(memberId: 6,
                   exDiaryId: 1,
                   memberName: "나다",
                   createdDate: "2023-10-17T15:01:21.896289",
                   modifiedDate: "2023-10-17T15:01:21.896289",
                   status: "T"),
    ] //멤버 조회 목업데이터
    
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea()
            
            VStack{
                Image("mechuri1") //로고 이미지
                    .resizable()
                    .frame(width: 30,height: 30)
                
                HStack{
                    
                    Spacer()
                    
                    Text("친구 목록")
                        .font(.Cafe2418)
                        .foregroundStyle(Color.fontColor)
                        .offset(x: deviceSize.width / 15)//?
                    
                   Spacer()
                    
                   Image(systemName: "person.badge.plus")
                        .font(.title3)
                        .padding()
                } //갈색 상단바
                .background(Rectangle()
                    .fill(Color.btnColor)
                    .frame(height: 40)
                )
//                List {
//                    ForEach(dataExample, id: \.self.memberId) { teamMember in
//                        Text("\(teamMember)")
//                        
//                    }
//                }
                
            } //상단 탭바
            
        }
    }
}

#Preview {
    ListOfMembersView()
}
