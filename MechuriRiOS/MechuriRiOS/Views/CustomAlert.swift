//
//  CustomAlert.swift
//  MechuriRiOS
//
//  Created by Minjae Kim on 11/22/23.
//

import SwiftUI

struct CustomAlert: View{
	@Binding var isPresentPopup: Bool
	var body:some View{
		VStack {
			Text("6개월 후에 편지를 보내드릴게요:>")
				.font(.Cafe2418)
				.font(.subheadline)
				.padding(30)
			
			NewContentDivider()
			
			Button {
				isPresentPopup.toggle()
			} label: {
				Text("확인")
					.frame(maxWidth: .infinity)
			}
			.padding(.bottom, 10)
		}
		.background(Color.white)
		.clipShape(.rect(cornerRadius: 5))
		
	}
}

#Preview {
	CustomAlert(isPresentPopup: .constant(true))
}
