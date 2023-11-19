//
//  TeamMember.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/20/23.
//

import Foundation
// 멤버 전체조회, 멤버 단일조회, 같은 교환일기 멤버 조회 !, 내가 포함된 교환일기 전체조회 <- 뭐임?
struct GetTeamMember: Decodable {
    let memberId, exDiaryId: Int
    let memberName, createdDate, modifiedDate, status: String
    
    enum CodingKeys: String, CodingKey {
        case memberId, exDiaryId, memberName, createdDate, modifiedDate, status
    }
}


/* 팀멤버 조회 목업데이터
 [
   {
     "memberId": 1,
     "exDiaryId": 1,
     "memberName": "박수현",
     "createdDate": "2023-10-17T15:01:21.896289",
     "modifiedDate": "2023-10-17T15:01:21.896289",
     "status": "T"
   },
   {
     "memberId": 2,
     "exDiaryId": 1,
     "memberName": "박수현2",
     "createdDate": "2023-10-17T15:01:55.782058",
     "modifiedDate": "2023-10-17T15:01:55.782058",
     "status": "T"
   }
 ]
 */
