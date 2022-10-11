//
//  Alerts.swift
//  VisualElements
//
//  Created by cturrion on 15/9/22.
//

import SwiftUI

struct TVShow: Identifiable {
    var id: String { name }
    let name: String
}

struct Alerts: View {
    @State private var selectedShow: TVShow?
    @State private var showingAlert = false
    
    var body: some View {
        
        VStack {
            
            Text("Alerts")
                .font(.largeTitle)
                .padding()
            
            Spacer()
            
            VStack(spacing: 20) {
                Text("¿Qué serie prefieres?")
                    .font(.headline)
                
                Button("Los anillos de Poder") {
                    selectedShow = TVShow(name: "Los anillos de Poder")
                }
                
                Button("La casa del dragón") {
                    selectedShow = TVShow(name: "La casa del dragón")
                }
            }
            .alert(item: $selectedShow) { show in
                Alert(title: Text(show.name), message: Text("Seguro?"), dismissButton: .cancel())
            }
                
            
            Spacer()
            
            VStack {
                Button("Alert iOS 15"){
                    showingAlert = true
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .buttonStyle(CambiarColorAlPulsar())
                .alert(
                    "Soy un alert para ios 15 en adelante",
                    isPresented: $showingAlert) {
                        Button("Vale", role: .cancel) { }
                    }
                
                
                Button("Alert con varios botones") {
                    showingAlert = true
                }
                .buttonStyle(CambiarColorAlPulsar())
                .alert("Important message", isPresented: $showingAlert) {
                    Button("First") { }
                    Button("Second") { }
                    Button("Third") { }
                    //Button(role: .destructive) { } label: {Label("Delete", systemImage: "trash")}
                }
                
            }
            
            Spacer()
        }
        
        //        Button("Show Alert") {
        //            showingAlert = true
        //        }
        //        .alert(isPresented: $showingAlert) {
        //            Alert(
        //                title: Text("Alert para"),
        //                message: Text("Wear sunscreen"),
        //                dismissButton: .default(Text("Got it!")))
        //        }
        
        
    }
}

struct Alerts_Previews: PreviewProvider {
    static var previews: some View {
        Alerts()
    }
}


//MARK: - Notas
// https://www.hackingwithswift.com/quick-start/swiftui/how-to-show-an-alert
