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
            TestingCustomShape().stroke(lineWidth: 5).foregroundStyle(.red)
        }

    }
}

struct TestingCustomShape : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: .zero, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX/2, y: rect.maxY/1.6))
        path.addLine(to: CGPoint(x: .zero, y: rect.maxY/4))
        path.addLine(to: CGPoint(x: rect.maxX, y: .zero))
        path.addLine(to: CGPoint(x: rect.maxX/2, y: rect.maxY/4))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY/1.6))
        path.addLine(to: CGPoint(x: .zero, y: rect.maxY))
        
        //Stripes
        path.move(to: CGPoint(x: rect.maxX/4.4, y: rect.maxY/1.2))
        path.addLine(to: CGPoint(x: rect.maxX/2.2, y: rect.maxY/1.2))
        path.move(to: CGPoint(x: rect.maxX/2.9, y: rect.maxY/1.35))
        path.addLine(to: CGPoint(x: rect.maxX/1.45, y: rect.maxY/1.35))
        path.move(to: CGPoint(x: rect.maxX/2, y: rect.maxY/1.6))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY/1.6))
        path.move(to: CGPoint(x: rect.maxX/3, y: rect.maxY/2))
        path.addLine(to: CGPoint(x: rect.maxX/1.2, y: rect.maxY/2))
        path.move(to: CGPoint(x: rect.maxX/5.5, y: rect.maxY/2.6))
        path.addLine(to: CGPoint(x: rect.maxX/1.46, y: rect.maxY/2.6))
        path.move(to: CGPoint(x: .zero, y: rect.maxY/4))
        path.addLine(to: CGPoint(x: rect.maxX/2, y: rect.maxY/4))
        path.move(to: CGPoint(x: rect.maxX/2.6, y: rect.maxY/6.5))
        path.addLine(to: CGPoint(x: rect.maxX/1.45, y: rect.maxY/6.5))
        path.move(to: CGPoint(x: rect.maxX/1.5, y: rect.maxY/12))
        path.addLine(to: CGPoint(x: rect.maxX/1.2, y: rect.maxY/12))


        return path
    }
}

#Preview {
    ShapePlayground()
}
