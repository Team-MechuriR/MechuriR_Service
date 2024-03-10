//
//  viewModel.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/20/23.
//
//공
//import Foundation
//class ContentViewModel: ObservableObject {
//    @Published var exDiaryData: [String] = ["예시"]
//    @Published var teamMemberData: [String] = ["예시"]
//    
//    func requestExDiaryGet() {
//        NetworkManager.shared.requestExDiary { exDiary, error in
//            if let error = error { //에러의 처리뷰
//                switch error {
//                case .badConnection :
//                    //alert
//                    print("연결이 불안정 합니다.")
//                case .invalidResponse :
//                    print("연결이 유효하지 않습니다.")
//                case .invalidData :
//                    print("유효하지 않은 데이터입니다.")
//                }
//            }
//            guard let exDiary = exDiary else {
//                print(error)
//                return
//            }
//            self.exDiaryData.append(exDiary.createdDate) // 예시
//        }
//    }
//    func requestTeamMemberGet() {
//        NetworkManager.shared.requestTeamMember { teamMember, error in
//            
//            guard let teamMember = teamMember else {
//                print(error)
//                return
//            }
//            self.teamMemberData.append(teamMember.memberName) // 예시
//        }
//    }
//}
