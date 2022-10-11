//
//  GradientColor.swift
//  VisualElements
//
//  Created by cturrion on 10/9/22.
//

import SwiftUI

struct GradientColor: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [naranja1, .red]), startPoint: .top, endPoint: .bottom)
                )
            Text("GRADIENT")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
        .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 3)
        .padding(50.0)
        
        // Color
        // .green.opacity(0.5)
        // .edgesIgnoringSafeArea(.all)
    }
}

struct GradientColor_Previews: PreviewProvider {
    static var previews: some View {
        GradientColor()
    }
}
