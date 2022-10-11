//  Test.swift
//  VisualElements
//  Created by cturrion on 10/9/22.

import SwiftUI

struct Test: View {
    @State var show: Bool = false
    @State var reverseDelay: Bool = false
    
    @State var delay1 = 0.3
    @State var delay2 = 0.5
    
    var body: some View {
        VStack {
            Button(action:{
                withAnimation {
                    self.show.toggle()
                }
            }) {
                Text("Anímate!")
                    .font(.largeTitle)
            }
            if show {
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(height: 100)
                    .transition(.move(edge: .trailing))
                    .transaction {
                        $0.animation = Animation.spring().delay(delay1)
                    }
                    .onAppear { self.delay1 = 0.5 }
                    .onDisappear { self.delay1 = 0.3 }
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(height: 100)
                    .transition(.move(edge: .trailing))
                    .transaction {
                        $0.animation = Animation.spring().delay(delay2)
                    }
                    .onAppear { self.delay2 = 0.3 }
                    .onDisappear { self.delay2 = 0.5 }
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
