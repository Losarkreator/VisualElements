//  Lista.swift
//  VisualElements
//  Created by cturrion on 9/9/22.

import SwiftUI

let url = "https://es.wikipedia.org/wiki/Wikipedia:Portada"

struct ListButton {
    let nextScreen: AnyView
    let text: Text
}

let listButtons:[ListButton] = [
    ListButton(nextScreen: AnyView(SimpleButton()), text: Text("Botones simples")),
    ListButton(nextScreen: AnyView(ButtonStyles()), text: Text("Botones")),
    ListButton(nextScreen: AnyView(Textos()), text: Text("Campos de Texto")),
    ListButton(nextScreen: AnyView(Formas()), text: Text("Formas")),
    ListButton(nextScreen: AnyView(GaleriaImagenes()), text: Text("GaleriaImagenes")),
    ListButton(nextScreen: AnyView(Colores()), text: Text("Colores")),
    ListButton(nextScreen: AnyView(GradientColor()), text: Text("Gradiente")),
    ListButton(nextScreen: AnyView(DragButton()), text: Text("DragButton")),
    ListButton(nextScreen: AnyView(SafariWebView(url: url)), text: Text("SafariWebView")),
//    ListButton(nextScreen: AnyView(Llamada()), text: Text("Llamada")),
    
    ListButton(nextScreen: AnyView(Alerts()), text: Text("Alerts"))
]

struct Lista: View {
    var network = Network()
    var body: some View {
        
        VStack {
            Text("Lista")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding()
            
            NavigationView {
                List {
                    ForEach(listButtons.indices) { index in
                        NavigationLink {
                            listButtons[index].nextScreen
                        } label: {
                            listButtons[index].text
                        }
                    }
                    
                    NavigationLink{
                        Llamada()
                    } label: {
                        Text("Lista")
                    }
                    
                }
            }
        }
            
    }
}

struct Lista_Previews: PreviewProvider {
    static var previews: some View {
        Lista()
    }
}


//MARK: - Lista vieja
/*
List {
    NavigationLink {
        // Destino
        SimpleButton()
    } label: {
        // Boton
        Text("Botones simples")
    }
    
    NavigationLink {
        ButtonStyles()
    } label: {
        Text("Botones")
    }
    
    NavigationLink {
        Textos()
    } label: {
        Text("Campos de Texto")
    }
    NavigationLink {
        Formas()
    } label: {
        Text("Formas") // Rectangle, Circle, rounded rectangle, Capsule
    }
    
    NavigationLink {
        GaleriaImagenes()
    } label: {
        Text("Imagenes")
    }
    
    NavigationLink {
        Colores()
    } label: {
        Text("Colores")
    }
    
    NavigationLink {
        GradientColor()
    } label: {
        Text("Gradient")
    }
    
    //NavigationLink {
    //GradientColor()
    //} label: {
    //Text("Pagina de Bankinter")
    //}
    
    NavigationLink {
        DragButton()
    } label: {
        Text("Test")
    }
    
    //Text("Login")
    //Text("Carrusel de Imagenes") // SF Symbols
}
.navigationTitle("Elementos Visuales")
 */
