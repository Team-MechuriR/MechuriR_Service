//
//  rootViews.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/16/23.
//
/*  위치정보 가져오는거 참고자료 https://codekodo.tistory.com/210#1.%20%EC%82%AC%EC%9A%A9%EC%9E%90%EA%B0%80%20%EC%A7%80%EB%8F%84%EB%A5%BC%20%EC%9B%80%EC%A7%81%EC%9D%B4%EB%A9%B4%20%EC%9B%80%EC%A7%81%EC%9D%B8%20%EC%A2%8C%ED%91%9C%EC%97%90%20%EB%8C%80%ED%95%9C%20%EB%8F%84%EB%A1%9C%EB%AA%85%20%EC%A3%BC%EC%86%8C%EB%A5%BC%20%EC%8B%A4%EC%8B%9C%EA%B0%84%EC%9C%BC%EB%A1%9C%20%EA%B0%80%EC%A0%B8%EC%98%A4%EA%B8%B0-1
 */
import SwiftUI


struct MainView: View { //메인뷰
    private var deviceSize: CGRect {
        return UIScreen.main.bounds
    }
    @State private var showMakeNewDiaryView: Bool = false
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea()
            
            VStack{
                Image("mechuri1")
                    .resizable()
                    .frame(width: 30,height: 30)
                
                HStack{
                    Text("[username] 의 일기장")
                        .font(.title3)
                        .foregroundStyle(Color.fontColor)
                        .bold()
                        .padding(7)
                    Spacer()
                }
                .background(Rectangle()
                    .fill(Color.btnColor)
                    .frame(width: deviceSize.width, height: 40)
                )
                
                HStack{
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Image("sampleDiaryMainImage")
                            .resizable()
                            .frame(width: 175,height: 175)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        Text("일기장제목")
                            .padding(.leading, 5)
                        Text("🕚2023.09.22 ~ 09.30")
                            .foregroundStyle(Color.gray)
                    }
                    .padding(5)
                    .background(Rectangle()
                        .fill(Color.btnColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    )
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Image("sampleDiaryMainImage")
                            .resizable()
                            .frame(width: 175,height: 175)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        Text("일기장제목")
                            .padding(.leading, 5)
                        Text("🕚2023.09.22")
                            .foregroundStyle(Color.gray)
                    }
                    .padding(5)
                    .background(Rectangle()
                        .fill(Color.btnColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    )
                    
                    Spacer()
                    
                }
                Spacer()
                HStack{
                    
                    Spacer()
                    
                    Button{
                        showMakeNewDiaryView.toggle()
                    }label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(Color.btnColor)
                            .font(.system(size: 56)) //그림자로 하려면 버튼 이미지로 생성해서 clipshape 설정하고 shadow 값 주면 되지만 일단 귀찮으니 패스
                            .padding()
                    }
                    .fullScreenCover(isPresented: $showMakeNewDiaryView) {
                        MakeNewDiaryView()
                    }
//                    .sheet(isPresented: $showMakeNewDiaryView) {
//                        MakeNewDiaryView()
//                            .presentationDetents([.medium])
//                    }
                }
            }
        }
        .frame(width: getRect().width, alignment: .leading)
    }
}


#Preview {
    MainView()
}
