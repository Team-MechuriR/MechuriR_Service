//
//  ExDiaryData.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/20/23.
//

import SwiftUI

// MARK: - Identifiable 채택하고 id 만들기
// MARK: - ImageData 추가
// MARK: - BackGroundColor 추가

struct ExDiary: Decodable { // 내가 포함된 교환일기 조회, 교환일기 단일조회
    let exDiaryId: Int
    
    let createdDate: String
    let modifiedDate: String
    
    let startDate: String
    let finishDate: String
    
    let exDiaryName: String
    let createMemberName: String
    
    enum CodingKeys: String, CodingKey {
        case exDiaryId, createdDate, modifiedDate, startDate, finishDate, exDiaryName, createMemberName
    }
}


