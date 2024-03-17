//
//  ListOfMemberView.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/22/23.
//

import SwiftUI

struct ListOfMembersView: View {
    @Environment(\.dismiss) var dismiss
    
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
                VStack {
                    Image("mechuri1") //로고 이미지
                        .resizable()
                        .frame(width: 30,height: 30)
                }
                .frame(height: 40)
                
                HStack{
                    Button {
                        dismiss()
                    } label: {
                         Image(systemName: "arrow.left")
                            .foregroundStyle(Color.fontColor)
                            .font(.title3)
                            .fontWeight(.heavy)
                    }
                    
                    Spacer()
                    
                    Text("멤버 목록")
                        .font(.Cafe2418)
                        .foregroundStyle(Color.fontColor)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "person.badge.plus")
                            .foregroundStyle(Color.fontColor)
                            .font(.title3)
                            .fontWeight(.heavy)
                    }
                }
                .padding(.horizontal, 10)//갈색 상단바
                .background(Rectangle()
                    .fill(Color.btnColor)
                    .frame(height: 40)
                )
                List {
                    ForEach(dataExample, id: \.self.memberId) { teamMember in
                        NavigationLink {
                           WriteLetterView()
                        } label: {
                            HStack {
                                Text(teamMember.memberName)
                                    .font(.Cafe2414)
                                
                                Spacer()
                                
                                Image(systemName: "paperplane")
                            }
                        }
                    }
                }
                .listRowSpacing(10)
                .background(Color.bgColor)
                .scrollContentBackground(.hidden)
                .navigationBarBackButtonHidden()
            } //상단 탭바
        }
    }
}
