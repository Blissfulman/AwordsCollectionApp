//
//  MyShapeAnimationView.swift
//  AwordsCollectionApp
//
//  Created by User on 27.12.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct MyShapeAnimationView: View {
    @State private var isShown = false
    @State private var isAnimated = false
    
    var body: some View {
        VStack {
            Button(action: { isShown.toggle() }) {
                HStack {
                    Text(isShown ? "Hide Shape" : "Show Shape")
                    Spacer()
                    Image(systemName: "chevron.up.square")
                        .scaleEffect(isShown ? 2 : 1)
                        .rotationEffect(.degrees(isShown ? 0 : 180))
                        .animation(.default)
                }
            }
            
            Toggle("Animated", isOn: $isAnimated)
                .padding(.top)
            
            Spacer()
            
            MyShapeView(width: 250,
                        height: 250,
                        isShown: $isShown,
                        isAnimated: $isAnimated)

            Spacer()
        }
        .font(.headline)
        .padding()
    }
}

struct MyShapeAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MyShapeAnimationView()
    }
}
