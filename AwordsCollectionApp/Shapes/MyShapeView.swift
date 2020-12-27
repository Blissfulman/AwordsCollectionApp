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
    
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.height, geometry.size.width)
            let nearLine = size * 0.05
            let farLine = size * 0.95
            let middle = size / 2
            let third = size / 3
            
            ZStack {
                ForEach(0..<8) { iteration in
                    Path { path in
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
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [.purple, .blue]),
                            center: .center,
                            startRadius: geometry.size.width * 0.08,
                            endRadius: geometry.size.width * 0.5)
                    )
                    .opacity(0.6)
                    .scaleEffect(1 - CGFloat(iteration) * 0.05)
                    .rotationEffect(.degrees(Double(iteration) * 35))
                }
            }
        }
        .frame(width: width, height: height)
    }
}

struct MyShapeView_Previews: PreviewProvider {
    static var previews: some View {
        MyShapeView(width: 200, height: 200)
    }
}
