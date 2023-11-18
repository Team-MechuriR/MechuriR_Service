//
//  CustomCorners.swift
//  MechuriRiOS
//
//  Created by 황민채 on 11/3/23.
//

import SwiftUI

//Custom Corner Shapes
struct CustomCorners: Shape {
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

