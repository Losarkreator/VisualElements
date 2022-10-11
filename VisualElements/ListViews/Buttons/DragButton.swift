//  DragButton.swift
//  VisualElements
//  Created by cturrion on 13/9/22.


import SwiftUI

struct DragButton: View {
    @State private var draggedOffset: CGSize = .zero
    
    var body: some View {
        VStack {
            ZStack {
                Capsule()
                    .fill(secondaryPurple)
                
                Circle()
                    .fill(.white)
                    .padding()
                    .position(CGPoint(x: 50, y: 50))
                    .offset(
                        CGSize(width: draggedOffset.width, height: 0 )
                    )
                    .gesture(
                        
                        DragGesture()
                            .onChanged { value in
                                if self.draggedOffset.width < 100 {
                                    self.draggedOffset = value.translation
                                }
                            }
                            .onEnded { value in
                                self.draggedOffset = .zero
                            }
                )
                    .onAppear(perform: {
                        print(draggedOffset)
                    })
            }
            .frame(maxWidth: 300, maxHeight: 100)
            
            Text("Offset: \(draggedOffset.width) ")
            //260 max
        }
        .frame(width: 200.0, height: 200.0)
    }
}

struct DragButton_Previews: PreviewProvider {
    static var previews: some View {
        DragButton()
    }
}

//MARK: - Notas
// https://www.youtube.com/watch?v=muHDX4ij_EQ&ab_channel=SwiftandTips
//https://stackoverflow.com/questions/58237325/swiftui-draggesture-only-in-one-direction
