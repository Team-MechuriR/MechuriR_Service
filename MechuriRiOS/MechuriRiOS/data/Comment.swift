//
//  Comment.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/20/23.
//

import SwiftUI

struct GetComment: Decodable {
    let commentId, diaryId: Int
    let createdDate, modifiedDate, writer, content: String
    
    enum CodingKeys: String, CodingKey {
        case commentId, diaryId, createdDate, modifiedDate, writer, content
    }
}

/* 댓글 목업데이터
[
  {
    "createdDate": "2023-10-17T15:06:04.572757",
    "modifiedDate": "2023-10-17T15:06:04.572757",
    "commentId": 1,
    "diaryId": 12,
    "writer": "박수현",
    "content": "~"
  }
]
*/
