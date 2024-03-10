//
//  Diary.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/20/23.
//

import SwiftUI

struct GetDiary: Decodable {
    let diaryId, exDiaryId, userId: Int
    let createdDate, modifiedDate, writing, img: String
    
    enum CodingKeys: String, CodingKey {
        case diaryId, exDiaryId, userId, createdDate, modifiedDate, writing, img
    }
}




/* 교환일기 내부 일기 모두 조회
 [
   {
     "createdDate": "2023-10-17T14:59:47.634231",
     "modifiedDate": "2023-10-17T14:59:47.634231",
     "diaryId": 1,
     "exDiaryId": 1,
     "userId": 1,
     "writing": "모임",
     "img": ".jpg"
   }
 ]
 */
