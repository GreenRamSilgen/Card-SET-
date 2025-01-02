//
//  ShapeTesting.swift
//  Card SET!
//
//  Created by Kiran Shrestha on 12/24/24.
//

import SwiftUI

struct ShapeTesting: View {
    var body: some View {
        HStack{
            CustomShape.Ellipses(customColor: .red, customStyle: .open, customAmount: 1)
            CustomShape.Ellipses(customColor: .blue, customStyle: .striped, customAmount: 1)
            CustomShape.Ellipses(customColor: .green, customStyle: .solid, customAmount: 1)
        }
        HStack{
            CustomShape.Squiggle(customColor: .red, customStyle: .open, customAmount: 1)
            CustomShape.Squiggle(customColor: .red, customStyle: .solid, customAmount: 1)
            CustomShape.Squiggle(customColor: .red, customStyle: .striped, customAmount: 1)
        }
        HStack{
            CustomShape.Diamond(customColor: .red, customStyle: .open, customAmount: 1)
            CustomShape.Diamond(customColor: .red, customStyle: .solid, customAmount: 1)
            CustomShape.Diamond(customColor: .red, customStyle: .striped, customAmount: 1)
        }
    }
}

struct CustomShape {
    struct Ellipses: View {
        let customColor: Color
        let customStyle: SetGameModel.Card.Shading
        let customAmount: Int
        
        var body: some View {
            ForEach(0..<customAmount, id: \.self) { _ in
                if customStyle == .striped {
                    EllipseShapeStriped(color: customColor, ellipseWidth: 100, ellipseHeight: 50).aspectRatio(3/5, contentMode: .fit)
                }
                else if customStyle == .open {
                    Ellipse().stroke(customColor, lineWidth: 5).aspectRatio(3/5, contentMode: .fit)
                }
                else {
                    Ellipse().fill(customColor).aspectRatio(3/5, contentMode: .fit)
                }
            }
        }
        struct EllipseShapeStriped: View {
            var color: Color
            var ellipseWidth: CGFloat?
            var ellipseHeight: CGFloat?
            var body: some View {
                Stripes(stripeWidth: 1, stripeHeight: 1)
                        .stroke(.red, lineWidth: 5)
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
                
                let stripeCount = Int(rect.height / stripeHeight)
                for i in 0..<stripeCount {
                    let yPosition = CGFloat(i) * 25
                    path.move(to: CGPoint(x: rect.minX, y: yPosition))
                    path.addLine(to: CGPoint(x: rect.maxX, y: yPosition))
                }
                                        
                return path
            }
        }
    }
    
    struct Squiggle: View {
        let customColor: Color
        let customStyle: SetGameModel.Card.Shading
        let customAmount: Int
        
        var body: some View {
            ForEach(0..<customAmount, id: \.self) { _ in
                if customStyle == .striped {
                    SquiggleShapeStriped().stroke(lineWidth: 5).foregroundStyle(customColor).aspectRatio(3/5, contentMode: .fit)
                }
                else if customStyle == .open {
                    SquiggleShape().stroke(customColor, lineWidth: 5).aspectRatio(3/5, contentMode: .fit)
                }
                else {
                    SquiggleShape().fill(customColor).aspectRatio(3/5, contentMode: .fit)
                }
            }
        }
        
        struct SquiggleShape : Shape {
            func path(in rect: CGRect) -> Path {
                var path = Path()
                path.move(to: CGPoint(x: .zero, y: rect.maxY))
                path.addLine(to: CGPoint(x: rect.maxX/2, y: rect.maxY/1.6))
                path.addLine(to: CGPoint(x: .zero, y: rect.maxY/4))
                path.addLine(to: CGPoint(x: rect.maxX, y: .zero))
                path.addLine(to: CGPoint(x: rect.maxX/2, y: rect.maxY/4))
                path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY/1.6))
                path.addLine(to: CGPoint(x: .zero, y: rect.maxY))
                return path
            }
        }


        struct SquiggleShapeStriped : Shape {
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
    }
    
    struct Diamond: View {
        let customColor: Color
        let customStyle: SetGameModel.Card.Shading
        let customAmount: Int
        var body: some View {
            ForEach(0..<customAmount, id: \.self) { _ in
                if customStyle == .striped {
                    DiamondShapeStriped().stroke(lineWidth: 5).foregroundStyle(customColor).aspectRatio(3/5, contentMode: .fit)
                }
                else if customStyle == .open {
                    DiamondShape().stroke(customColor, lineWidth: 5).aspectRatio(3/5, contentMode: .fit)
                }
                else {
                    DiamondShape().fill(customColor).aspectRatio(3/5, contentMode: .fit)
                }
            }
        }
        
        struct DiamondShape : Shape {
            func path(in rect: CGRect) -> Path {
                var path = Path()
                
                path.move(to: CGPoint(x: rect.maxX/2, y: rect.maxY))
                path.addLine(to: CGPoint(x: .zero, y: rect.maxY/2))
                path.addLine(to: CGPoint(x: rect.maxX/2, y: .zero))
                path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY/2))
                path.addLine(to: CGPoint(x: rect.maxX/2, y: rect.maxY))
                return path
            }
        }
        
        struct DiamondShapeStriped : Shape {
            func path(in rect: CGRect) -> Path {
                var path = Path()
                
                path.move(to: CGPoint(x: rect.maxX/2, y: rect.maxY))
                path.addLine(to: CGPoint(x: .zero, y: rect.maxY/2))
                path.addLine(to: CGPoint(x: rect.maxX/2, y: .zero))
                path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY/2))
                path.addLine(to: CGPoint(x: rect.maxX/2, y: rect.maxY))
                
                //Striped
                var counter = 0
                let xPosJumpAmt = Int(rect.maxX)/10
                for yPosition in stride(from: Int(rect.maxY/2), to: 0, by: -Int(rect.maxY/10)) {
                    print("ypos = \(yPosition) calc = \(xPosJumpAmt*counter)")
                    path.move(to: CGPoint(x: (xPosJumpAmt*counter), y: yPosition))
                    path.addLine(to: CGPoint(x: Int(rect.maxX)-(xPosJumpAmt*counter), y: yPosition))
                    counter += 1
                }
                counter = 0
                for yPosition in stride(from: Int(rect.maxY/2), to: Int(rect.maxY), by: Int(rect.maxY/10)) {
                    print("ypos = \(yPosition) calc = \(xPosJumpAmt*counter)")
                    path.move(to: CGPoint(x: (xPosJumpAmt*counter), y: yPosition))
                    path.addLine(to: CGPoint(x: Int(rect.maxX)-(xPosJumpAmt*counter), y: yPosition))
                    counter += 1
                    
                }
                return path
            }
        }
    }
}







#Preview {
    ShapeTesting()
}
