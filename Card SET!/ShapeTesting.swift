//
//  ShapeTesting.swift
//  Card SET!
//
//  Created by Kiran Shrestha on 12/24/24.
//

import SwiftUI

struct ShapeTesting: View {
    var body: some View {
        SetEllipses(customColor: .red, customStyle: .open, customAmount: 1)
        SetEllipses(customColor: .blue, customStyle: .striped, customAmount: 1)
        SetEllipses(customColor: .green, customStyle: .solid, customAmount: 1)
    }
}

struct SetEllipses: View {
    let customColor: Color
    let customStyle: SetGameModel.Card.Shading
    let customAmount: Int
    
    var body: some View {
        ForEach(0..<customAmount, id: \.self) { _ in
            if customStyle == .striped {
                EllipseWithStripes(color: customColor, ellipseWidth: 100, ellipseHeight: 50).rotationEffect(Angle(degrees: 90)).aspectRatio(3/5, contentMode: .fit)
            }
            else if customStyle == .open {
                Ellipse().rotation(Angle(degrees: 90)).stroke(customColor, lineWidth: 5).aspectRatio(3/5, contentMode: .fit)
            }
            else {
                Ellipse().rotation(Angle(degrees: 90)).fill(customColor).aspectRatio(3/5, contentMode: .fit)
            }
        }
    }
}



struct EllipseWithStripes: View {
    var color: Color
    var ellipseWidth: CGFloat?
    var ellipseHeight: CGFloat?
    var body: some View {
        Stripes(stripeWidth: 1, stripeHeight: 1)
                .stroke(.red, lineWidth: 1)
                .clipShape(Ellipse())
//                .frame(width: ellipseWidth, height: ellipseHeight)
    }
}

struct Stripes: Shape {
    let stripeWidth: CGFloat
    let stripeHeight: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let ellipseRect = CGRect(origin: .zero, size: rect.size)
        path.addEllipse(in: ellipseRect)
        
        let stripeCount = Int(rect.width / stripeWidth)
        for i in 0..<stripeCount {
            let xPosition = CGFloat(i) * 10
            path.move(to: CGPoint(x: xPosition, y: rect.minY))
            path.addLine(to: CGPoint(x: xPosition, y: rect.maxY))
        }
                                
        return path
    }
}

#Preview {
    ShapeTesting()
}
