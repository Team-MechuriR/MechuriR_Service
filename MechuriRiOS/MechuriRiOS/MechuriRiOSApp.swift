//
//  MechuriRiOSApp.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/3/23.
//

import SwiftUI

@main
struct MechuriRiOSApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView(userData: UserData(url: nil, name: "", email: ""))
        }
    }
}
