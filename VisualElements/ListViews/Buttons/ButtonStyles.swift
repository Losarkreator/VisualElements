//
//  ButtonStyles.swift
//  VisualElements
//
//  Created by cturrion on 9/9/22.
//

import SwiftUI

struct ButtonStyles: View {
    @State var checked = false
    
    var body: some View {
        VStack {
            Text("Botones")
                .font(.largeTitle)
            
            VStack(spacing: 20.0) {
                Button("Rounded Rectangle Button") {
                }
                .buttonStyle(RoundedRectangleButtonStyle())
                
                Button("SABER MÁS") {
                }
                .buttonStyle(CambiarColorAlPulsar())
                
                Button("Doble Tap") {
                    checked = !checked
                }
                //.buttonStyle(SwipeButtonStyle())
                .buttonStyle(DoubleTapStyle())
                .buttonStyle(PlainNoTapStyle())
                .buttonStyle(RoundedRectangleButtonStyle())
                
                //TODO: Arreglar boton original
                //DragButton()
                
            }
            .padding()
            
            VStack {
                // Check box
                CheckBoxView(checked: $checked, texto: "CheckBox")
                //Toggle
                Toggle("Toggle", isOn: $checked)
                    .padding(.horizontal, 100)
                
                SliderCustom()
                    .padding()
                
                StepperView()
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyles()
    }
}

//MARK: - Doble Tap
struct DoubleTapOnlyStyle: PrimitiveButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .onTapGesture(count: 2, perform: configuration.trigger)
  }
}

// La acción del botón se activa con dos toques.
struct DoubleTapStyle: PrimitiveButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    Button(configuration) // <- Button instead of configuration.label
      .onTapGesture(count: 2, perform: configuration.trigger)
  }
}

struct CustomSwipeButtonStyle: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(configuration)
            .gesture(
                DragGesture()
                    .onEnded { _ in
                        configuration.trigger()
                    }
                    
            )
        
    }
}

struct PlainNoTapStyle: PrimitiveButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    Button(configuration)
//      .buttonStyle(PlainButtonStyle()) // elimina cualquier apariencia por defecto
      .allowsHitTesting(false)         // no mas activadores en los taps
      .contentShape(Rectangle())       // dejar que otras interacciones funcionen
  }
}

//MARK: - Estilos
// Crear estilo "Saber Más" con reyeno cuando pasas por encima
struct CambiarColorAlPulsar: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 10)
            .padding(.horizontal, 45)
            .background(configuration.isPressed ? naranja2 : .white)
            .overlay(Capsule().stroke((configuration.isPressed ? naranja2 : naranja1), lineWidth: 1.5))
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .foregroundColor(configuration.isPressed ? .white : naranja1)
            .font(.system(size: 20, weight: .light, design: .default))
        //          .scaleEffect(configuration.isPressed ? 1.1 : 1) //Hacer grande
        //          .animation(.easeIn, value: configuration.isPressed)
        //.font(.custom("AmericanTypewriter", fixedSize: 26))
    }
}

struct RoundedRectangleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            configuration.label.foregroundColor(.black)
            //.shadow(color: configuration.isPressed ? Color.red : Color.black, radius: 4, x: 0, y: 3)
            Spacer()
        }
        .padding()
        .background(Color.yellow.cornerRadius(8))
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct ShadowButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .shadow(
                color: configuration.isPressed ? Color.blue : Color.black,
                radius: 4, x: 0, y: 3
            )
    }
}



//MARK: - Stepper
struct StepperView: View {
    @State private var value = 0
    let step = 5
    let range = 1...50

    var body: some View {
        Stepper(value: $value,
                in: range,
                step: step) {
            Text("Current: \(value) in \(range.description) " +
                 "stepping by \(step)")
        }
            .padding(10)
    }
}

//MARK: - Slider
struct SliderCustom: View {
    @State private var speed = 50.0
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            Slider(
                value: $speed,
                in: 0...100,
                onEditingChanged: { editing in
                    isEditing = editing
                }
            )
            Text("\(speed)")
                .foregroundColor(isEditing ? .red : .blue)
        }
    }
}

//MARK: - CheckBox
struct CheckBoxView: View {
    @Binding var checked: Bool
    var texto: String?
    
    var body: some View {
        HStack {
            Image(systemName: checked ? "checkmark.square.fill" : "square")
                .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
                .onTapGesture {
                    self.checked.toggle()
                }
            Text(texto ?? "Texto")
        }
    }
}

//MARK: - Swipe
// La acción del botón se activa al deslizar el dedo.
// (incluso cuando termina fuera del botón)
struct SwipeButtonStyle: PrimitiveButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    Button(configuration)
      .gesture(
        DragGesture()
          .onEnded { _ in
            configuration.trigger()
          }
      )
  }
}

//MARK: - Notas
// Boton con animacion https://developer.apple.com/tutorials/swiftui/animating-views-and-transitions

// Mas elementos: https://developer.apple.com/documentation/swiftui/editbutton

// Estilos: https://www.fivestars.blog/articles/button-styles/
