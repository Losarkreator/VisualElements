//
//  DragGestureDemoYT.swift
//  VisualElements
//
//  Created by cturrion on 13/9/22.
//

import SwiftUI

struct DragGestureDemoYT: View {
    @GestureState var locationState = CGPoint(x: 100, y: 100)
    @State var locationPoint = CGPoint(x: 100, y: 100)
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            
            Circle()
                .fill(.red)
                .frame(width: 100, height: 100, alignment: .center)
                .position(locationPoint)
                .gesture(
                    // minimumDistance = Distancia minima para activar el trigger
                    // coordinateSpace = Coordenadas relativas al padre (local) o a la pantalla (global)
                    DragGesture(minimumDistance: 200, coordinateSpace: .local)
                        .onChanged{ state in
                            locationPoint = state.location
                        }
                    
                        .onEnded(){ state in
                            withAnimation{
                                locationPoint = CGPoint(x: 100, y: 100)
                            }
                        }
                    
                        .updating(
                            $locationState
                        ) { currentState, pastLocation, transaction in
                            pastLocation = currentState.location // The location of the drag gesture’s current event.
                            transaction.animation = .easeInOut
                        }
                )
        }
    }
}

struct DragGestureDemoYT_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureDemoYT()
    }
}

//MARK: - Notas:
// https://www.youtube.com/watch?v=muHDX4ij_EQ&ab_channel=SwiftandTips
