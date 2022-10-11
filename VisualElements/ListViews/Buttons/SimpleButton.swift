//
//  SimpleButton.swift
//  VisualElements
//
//  Created by cturrion on 9/9/22.
//

import SwiftUI

// https://www.fivestars.blog/articles/button-styles/

struct SimpleButton: View {
    var body: some View {
        ZStack {
            
#if DEBUG
//            Color
//                .black.opacity(0.5)
//                .edgesIgnoringSafeArea(.all)
#endif
            
            VStack {
                Button("Simple button") {
                    // button tapped
                }
                
                Divider()
                    .padding()
                
                Button("Plain style button") {
                    // button tapped
                }
                .buttonStyle(PlainButtonStyle())
                
                Divider()
                    .padding()
                
                Button("SABER MÁS") {
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 45)
                .background(Color.white)
                .clipShape(Capsule())
                .foregroundColor(.black)
                .overlay(Capsule().stroke(Color.orange, lineWidth: 1.5))
                
                Divider()
                
                Text("Image Button:")
                    .font(.footnote)
                    .padding(/*@START_MENU_TOKEN@*/.top/*@END_MENU_TOKEN@*/)
                    
                
                Button(action: {}) {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        
                    //.renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                }
                
                Text("Text and Image Button:")
                    .font(.footnote)
                    .padding(/*@START_MENU_TOKEN@*/.top/*@END_MENU_TOKEN@*/)
                    
                
                Button(action: {}) {
                    HStack {
                        Image(systemName: "plus.circle")
                        Text("Texto e imagen")
                    }
                }
                .buttonStyle(CambiarColorAlPulsar())
                
            }
        }
    }
}

struct SimpleButton_Previews: PreviewProvider {
    static var previews: some View {
        SimpleButton()
        //            .environment(\.colorScheme, .dark)
    }
}
