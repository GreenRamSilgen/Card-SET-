//
//  ShapeTesting.swift
//  Card SET!
//
//  Created by Kiran Shrestha on 12/24/24.
//

import SwiftUI

struct ShapeTesting: View {
    var body: some View {
//        CustomShapes.Ellipses(customColor: .red, customStyle: .open, customAmount: 1)
//        CustomShapes.Ellipses(customColor: .blue, customStyle: .striped, customAmount: 1)
//        CustomShapes.Ellipses(customColor: .green, customStyle: .solid, customAmount: 1)
//        CustomShapes.Squiggle(customColor: .red, customStyle: .solid, customAmount: 3)
        TestingCustomShape
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
                    EllipseStriped(color: customColor, ellipseWidth: 100, ellipseHeight: 50).rotationEffect(Angle(degrees: 90)).aspectRatio(3/5, contentMode: .fit)
                }
                else if customStyle == .open {
                    Ellipse().rotation(Angle(degrees: 90)).stroke(customColor, lineWidth: 5).aspectRatio(3/5, contentMode: .fit)
                }
                else {
                    Ellipse().rotation(Angle(degrees: 90)).fill(customColor).aspectRatio(3/5, contentMode: .fit)
                }
            }
        }
        struct EllipseStriped: View {
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
                path.move(to: CGPoint(x: rect.maxX/3, y: rect.maxY/1.5))
                
                path.addQuadCurve(to: CGPoint(x: rect.maxX/1.9, y: rect.maxY/2), control: CGPoint(x: rect.maxX/1.5, y: rect.maxY/1.5))
                path.addQuadCurve(to: CGPoint(x: rect.maxX/2, y: rect.maxY/4), control: CGPoint(x: rect.maxX/3, y: rect.maxY/4))
                
                
                path.addCurve(to: CGPoint(x: rect.maxX/1.3, y: rect.maxY/2.5), control1: CGPoint(x: rect.maxX, y: rect.maxY/4), control2: CGPoint(x: rect.maxX, y: rect.maxY/2))
                
                
                path.addQuadCurve(to: CGPoint(x: rect.maxX/1.3, y: rect.maxY/1.8), control: CGPoint(x: rect.maxX/1.9, y: rect.maxY/3))
                path.addQuadCurve(to: CGPoint(x: rect.maxX/2.7, y: rect.maxY/1.27), control: CGPoint(x: rect.maxX, y: rect.maxY/1.3))
                
                
                path.addCurve(to: CGPoint(x: rect.maxX/3, y: rect.maxY/1.5), control1: CGPoint(x: rect.maxX/6, y: rect.maxY/1.25), control2:  CGPoint(x: rect.maxX/6, y: rect.maxY/1.5))
                
                return path
            }
        }


        struct SquiggleShapeStriped : Shape {
            func path(in rect: CGRect) -> Path {
                var path = Path()
                path.move(to: CGPoint(x: rect.maxX/3, y: rect.maxY/1.5))

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

                return path
            }
        }
    }
    
    struct Diamond: View {
        var body: some View {
            Diamond()
        }
    }
}







#Preview {
    ShapeTesting()
}
