//
//  Notice.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/20/23.
//

import SwiftUI

struct GetSingleNotice: Decodable {
    let noticeId, exDiaryId: Int
    let getUser, sendUser, noticeType, content, noticeURL, createdDate, modifiedDate, readCheck: String
    
    enum CodingKeys: String, CodingKey {
        case noticeId, exDiaryId, getUser, sendUser, noticeType, content, noticeURL, createdDate, modifiedDate, readCheck
    }
}

//struct GetAllNotice: Decodable {
//    let
//}

/* 전체 알림 조회 목업데이터
 {
   "content": [
     {
       "createdDate": "2023-11-02T18:56:12.221173",
       "modifiedDate": "2023-11-02T18:56:12.221173",
       "noticeId": 2,
       "getUser": "박수현",
       "sendUser": "박수현1",
       "noticeType": "create",
       "exDiaryId": 1,
       "content": "새로운 모임에 초대되었습니다",
       "noticeURL": "http://~~",
       "readCheck": "F"
     },
     {
       "createdDate": "2023-11-02T18:55:40.591693",
       "modifiedDate": "2023-11-02T18:55:40.591693",
       "noticeId": 1,
       "getUser": "박수현",
       "sendUser": "박수현1",
       "noticeType": "message",
       "exDiaryId": 1,
       "content": "안녕~~",
       "noticeURL": "http://~~",
       "readCheck": "F"
     }
   ],
   "pageable": {
     "sort": {
       "empty": false,
       "sorted": true,
       "unsorted": false
     },
     "offset": 0,
     "pageSize": 5,
     "pageNumber": 0,
     "paged": true,
     "unpaged": false
   },
   "last": true,
   "totalPages": 1,
   "totalElements": 2,
   "size": 5,
   "number": 0,
   "sort": {
     "empty": false,
     "sorted": true,
     "unsorted": false
   },
   "first": true,
   "numberOfElements": 2,
   "empty": false
 }
 */

/* 알림 단일조회 목업데이터
{
  "noticeId": 1,
  "getUser": "박수현",
  "sendUser": "박수현1",
  "noticeType": "message",
  "exDiaryId": 1,
  "content": "안녕~~",
  "noticeURL": "http://~~",
  "createdDate": "2023-11-02T18:55:40.591693",
  "modifiedDate": "2023-11-02T18:55:40.591693",
  "readCheck": "T"
}
*/
