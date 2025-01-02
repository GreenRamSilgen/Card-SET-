//
//  ShapePlayground.swift
//  Card SET!
//
//  Created by Kiran Shrestha on 12/29/24.
//

import SwiftUI

struct ShapePlayground: View {
    var body: some View {
        VStack {
            Text("Temp")
            CustomShape().stroke(lineWidth: 10)
        }

    }
}

struct CustomShape : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
//        let ellipseRect = CGRect(origin: .zero, size: rect.size)
//        path.addEllipse(in: ellipseRect)
        path.move(to: CGPoint(x: rect.maxX/3, y: rect.maxY/1.5))
        
//        path.addLine(to: CGPoint(x: rect.maxX, y: .zero))

        path.addQuadCurve(to: CGPoint(x: rect.maxX/1.9, y: rect.maxY/2), control: CGPoint(x: rect.maxX/1.5, y: rect.maxY/1.5))
        path.addQuadCurve(to: CGPoint(x: rect.maxX/2, y: rect.maxY/4), control: CGPoint(x: rect.maxX/3, y: rect.maxY/4))
        
        
        path.addCurve(to: CGPoint(x: rect.maxX/1.3, y: rect.maxY/2.5), control1: CGPoint(x: rect.maxX, y: rect.maxY/4), control2: CGPoint(x: rect.maxX, y: rect.maxY/2))
        
        
        path.addQuadCurve(to: CGPoint(x: rect.maxX/1.3, y: rect.maxY/1.8), control: CGPoint(x: rect.maxX/1.9, y: rect.maxY/3))
        path.addQuadCurve(to: CGPoint(x: rect.maxX/2.7, y: rect.maxY/1.27), control: CGPoint(x: rect.maxX, y: rect.maxY/1.3))
        
        
        path.addCurve(to: CGPoint(x: rect.maxX/3, y: rect.maxY/1.5), control1: CGPoint(x: rect.maxX/6, y: rect.maxY/1.25), control2:  CGPoint(x: rect.maxX/6, y: rect.maxY/1.5))
        
        //Stripes
        path.addLine(to: CGPoint(x: rect.maxX/3, y: rect.maxY/1.28))
        path.move(to: CGPoint(x: rect.maxX/2, y: rect.maxY/1.54))
        path.addLine(to: CGPoint(x: rect.maxX/2, y: rect.maxY/1.28))
        path.move(to: CGPoint(x: rect.maxX/2, y: rect.maxY/4))
        path.addLine(to: CGPoint(x: rect.maxX/2, y: rect.maxY/2.15))
        path.move(to: CGPoint(x: rect.maxX/1.6, y: rect.maxY/4))
        path.addLine(to: CGPoint(x: rect.maxX/1.6, y: rect.maxY/1.3))
        path.move(to: CGPoint(x: rect.maxX/1.35, y: rect.maxY/3.7))
        path.addLine(to: CGPoint(x: rect.maxX/1.35, y: rect.maxY/2.55))
        path.move(to: CGPoint(x: rect.maxX/1.35, y: rect.maxY/1.9))
        path.addLine(to: CGPoint(x: rect.maxX/1.35, y: rect.maxY/1.35))
        path.move(to: CGPoint(x: rect.maxX/1.2, y: rect.maxY/3.3))
        path.addLine(to: CGPoint(x: rect.maxX/1.2, y: rect.maxY/2.4))
//        path.addArc(center: CGPoint(x: rect.maxX/1.3, y: rect.maxY/4), radius: 3, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 180), clockwise: true)
        
        // TODO: Maybe use path.addRelativeArc to create the closing edges?
        return path
    }
    
    
}

#Preview {
    ShapePlayground()
}
