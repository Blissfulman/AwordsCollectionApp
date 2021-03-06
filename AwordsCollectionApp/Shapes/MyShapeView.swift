//
//  MyShapeView.swift
//  AwordsCollectionApp
//
//  Created by User on 26.12.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct MyShapeView: View {
    let width: CGFloat
    let height: CGFloat
    
    @Binding var isShown: Bool
    @Binding var isAnimated: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<8) { iteration in
                    getMyShapePath(geometry: geometry)
                        .fill(
                            RadialGradient(
                                gradient: Gradient(colors: [.purple, .blue]),
                                center: .center,
                                startRadius: geometry.size.width * 0.08,
                                endRadius: geometry.size.width * 0.5)
                        )
                        .scaleEffect(
                            isShown
                                ? 1 - CGFloat(iteration) * 0.05
                                : 0.25
                        )
                        .opacity(isShown ? 0.6 : 0)
                        .rotationEffect(
                            .degrees(
                                isShown
                                    ? Double(iteration) * 35
                                    : -720
                            )
                        )
                        .animation(
                            .easeOut(
                                duration: isAnimated
                                    ? 1 + Double(iteration) * 0.2
                                    : 0
                            )
                        )
                }
            }
        }
        .frame(width: width, height: height)
    }
    
    private func getMyShapePath(geometry: GeometryProxy) -> Path {
        let size = min(geometry.size.height, geometry.size.width)
        let nearLine = size * 0.05
        let farLine = size * 0.95
        let middle = size / 2
        let third = size / 3
        
        return Path { path in
            path.move(to: CGPoint(x: middle, y: nearLine))
            path.addCurve(
                to: CGPoint(x: farLine, y: middle),
                control1: CGPoint(x: farLine, y: nearLine),
                control2: CGPoint(x: middle, y: 2 * third)
            )
            path.addCurve(
                to: CGPoint(x: middle, y: farLine),
                control1: CGPoint(x: farLine, y: farLine),
                control2: CGPoint(x: third, y: middle)
            )
            path.addCurve(
                to: CGPoint(x: nearLine, y: middle),
                control1: CGPoint(x: nearLine, y: farLine),
                control2: CGPoint(x: middle, y: third)
            )
            path.addCurve(
                to: CGPoint(x: middle, y: nearLine),
                control1: CGPoint(x: nearLine, y: nearLine),
                control2: CGPoint(x: 2 * third, y: middle)
            )
        }
    }
}

struct MyShapeView_Previews: PreviewProvider {
    static var previews: some View {
        MyShapeView(width: 200,
                    height: 200,
                    isShown: .constant(true),
                    isAnimated: .constant(true))
    }
}
