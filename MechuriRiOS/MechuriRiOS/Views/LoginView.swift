//
//  LoginView.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/3/23.
//

//import SwiftUI
//import GoogleSignIn
//
//import KakaoSDKAuth
//import KakaoSDKCommon
//import KakaoSDKUser
//
//struct LoginView: View {
//    
//    @StateObject var kakaoAuthVM: KaKaoAuthVM = KaKaoAuthVM()
//    @State private var isLoggedIn: Bool = false
//    
//    // 임시 구글 로그인 상태
//    @State private var isLogined: Bool = false
//    // 임시 구글 유저 데이터
//    @State private var userData: UserData
//    // 임시 구글 팝업용
//    @State private var isAlert = true
//    
//    public init(isLogined: Bool = false, userData: UserData) {
//        _isLogined = State(initialValue: isLogined)
//        _userData = State(initialValue: userData)
//    }
//    
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                Color(.bg)
//                    .ignoresSafeArea(.all)
//                
//                VStack(spacing: 20) {
//                    
//                    Image("mechuri1")
//                        .resizable()
//                        .frame(width: 270, height: 270)
//                    
//                    // 카카오
//                    Button {
//                        kakaoAuthVM.handleKakaoLogin()
//                    } label: {
//                        Image("kakao_login")
//                            .resizable()
//                            .frame(width: 277, height: 46)
//                    }
//                    
//                    // 구글
//                    Button {
//                        googleLogin()
//                    } label: {
//                        Image("google_login")
//                            .resizable()
//                            .frame(width: 277, height: 46)
//                    }
//                    
//                }
//                .navigationDestination(isPresented: $isLogined, destination: {
//                    NextPageView(userData: $userData)
//                })
//                .onAppear {
//                    // 구글 로그인 상태 체크
//                    checkState()
//                }
//                .alert(LocalizedStringKey("로그인 실패"), isPresented: $isAlert) {
//                    Text("확인")
//                } message: {
//                    Text("다시 시도해주세요")
//                }
//            }
//        }
//    }
//    
//    // 구글 상태 체크
//    func checkState() {
//        GIDSignIn.sharedInstance.restorePreviousSignIn { [self] user, error in
//            if error != nil || user == nil {
//                // 로그아웃 상태
//                print("구글 로그아웃 상태")
//            } else {
//                // 로그인 상태
//                guard let profile = user?.profile else { return }
//                let data = UserData(url: profile.imageURL(withDimension: 180), name: profile.name, email: profile.email)
//                userData = data
//                isLogined = true
//                print(isLogined)
//            }
//        }
//    }
//    // 구글 로그인
//    func googleLogin() {
//        // rootViewController
//        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else { return }
//        // 로그인 진행
//        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { signInResult, error in
//            guard let result = signInResult else {
//                isAlert = true
//                return
//            }
//            
//            guard let profile = result.user.profile else { return }
//            let data = UserData(url: profile.imageURL(withDimension: 180), name: profile.name, email: profile.email)
//            self.userData = data
//            self.isLogined = true
//        }
//    }
//}
//
//#Preview {
//    LoginView(userData: UserData(url: nil, name: "", email: ""))
//}
