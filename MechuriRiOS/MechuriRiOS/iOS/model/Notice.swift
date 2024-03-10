//
//  Notice.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/20/23.
//

import SwiftUI

struct Notice: Decodable {
    var noticeId: Int
    var exDiaryId: Int
    var getUser: String
    var sendUser: String
    var noticeType: String
    var content: String
    var createdDate: String
    var modifiedDate: String
}

struct NoticesResponse: Decodable {
    let content: [Notice]
}
