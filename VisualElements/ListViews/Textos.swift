//
//  Textos.swift
//  VisualElements
//
//  Created by cturrion on 9/9/22.
//

import SwiftUI

struct Textos: View {
    @State var inputText: String = ""
    
    var body: some View {
        ScrollView() {
            VStack() {
                Text("TITULO")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Divider()
                    .padding()
                
                Text("Custom Font")
                    .font(.custom("AmericanTypewriter", fixedSize: 26))
                
                Divider()
                    .padding()
                
                TextField("Soy un TextField simple, escribe algo...", text: .constant(""))
                    .padding(.horizontal)
                
                Divider()
                    .padding()
                
                Group {
                    TextField("Con estilo...", text: $inputText)
                    // .frame(height: 44)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    if !inputText.isEmpty {
                        Text("User say: " + inputText)
                    }
                }
                
                Divider()
                    .padding()
                
                TextField("Color de fondo + Color de texto ", text: .constant(""))
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.orange, lineWidth: 3))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Divider()
                    .padding()
            }
            
            VStack(alignment: .leading) {
                Text("Secure Field:")
                    .font(.caption)
                SecureField("Password", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                // Añadir el ojo
                
                Divider()
                    .padding()
                
                //Texto largo
                VStack {
                    Text("Texto Largo:")
                        .font(.caption)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eget sapien ut sem dictum sagittis quis a velit. In sagittis, quam id egestas porta, lectus nunc semper metus, nec rhoncus turpis quam ac velit. Curabitur ornare erat eu lectus semper, et lacinia nunc imperdiet. Maecenas at elementum leo. Nulla imperdiet tincidunt arcu et sodales. Nulla augue diam, facilisis auctor risus ut, lacinia tristique velit. Pellentesque convallis nunc vitae libero sagittis, ac bibendum magna condimentum. Maecenas laoreet vestibulum rutrum. Donec mollis suscipit erat, vitae hendrerit nisl ullamcorper nec. Aliquam erat volutpat. Curabitur porta porttitor turpis ut posuere. Fusce venenatis molestie elit quis laoreet. Vivamus at ligula et risus luctus lacinia semper eu ligula. Aenean mauris sem, convallis et diam ac, suscipit tempor dui. Nulla nibh mauris, cursus ac lacus in, congue ullamcorper elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed ac leo mauris. Vestibulum ullamcorper elit eu porta elementum. Vestibulum dapibus, nulla et dignissim lobortis, mi sem gravida libero, ultricies viverra ex enim efficitur mi. Morbi sit amet imperdiet ipsum, nec vulputate ipsum. Phasellus felis nulla, mollis id molestie vitae, consequat at lorem. Vestibulum vel tortor nec urna volutpat bibendum. Sed vestibulum lobortis purus, quis porta sem ullamcorper vel. Nunc ut nulla nisi. Nulla porttitor mi nec lorem euismod, nec eleifend erat gravida. In pellentesque sapien in arcu luctus, non ultricies tellus lacinia. Nulla rhoncus quam ut imperdiet fringilla. Quisque id vulputate mi. Vivamus a felis aliquet, tempus lectus a, tristique odio. Nullam ullamcorper tristique quam ac fringilla. Nam non leo ante. Etiam posuere risus eget mauris sagittis, eu iaculis ligula viverra. In hac habitasse platea dictumst. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus volutpat fermentum nisl et malesuada. Duis ultrices mauris sit amet tellus varius mattis. Etiam dictum purus quam, in pellentesque purus maximus in. Fusce in augue euismod lorem consectetur volutpat quis vitae odio. Curabitur eu tempus ligula, ut rutrum purus. Vivamus tellus eros, viverra non scelerisque ut, vestibulum nec odio. Fusce porttitor dolor justo, ac dignissim nulla molestie sit amet. Morbi egestas ultrices odio. Morbi laoreet condimentum tellus dictum tempus. Praesent sollicitudin blandit mauris eu dictum. Sed luctus lobortis nisi, et lacinia dolor pretium sed. Maecenas erat eros, hendrerit at eros ac, sodales ultricies est. Maecenas dignissim id augue at pulvinar. Nulla varius, risus consectetur convallis faucibus, nibh nulla accumsan lorem, sit amet mattis lacus purus vel mi. Etiam quis commodo elit. Nunc eget venenatis eros. Suspendisse cursus tincidunt urna a aliquet. Etiam ut mi neque. Nullam accumsan augue et malesuada viverra. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla ullamcorper maximus felis quis sagittis. Nunc maximus dolor vel sodales mattis. Nulla ac dignissim enim, quis pharetra urna. Duis vel sem sed ipsum eleifend tincidunt. Proin et aliquet purus, et dignissim arcu. Curabitur tincidunt leo sed neque fringilla lacinia. Sed est mi, egestas ut nibh in, pretium eleifend est. Nullam accumsan mauris odio, sit amet viverra odio dignissim at. Nulla felis tellus, vehicula non purus vitae, faucibus facilisis ipsum.")
                }
                .frame( maxWidth: .infinity)
            }
            Spacer()
        }
        .padding(.horizontal)
        .onTapGesture { // OCULTAR TECLADO
            self.hideKeyboard()
        }
    }
}

struct Textos_Previews: PreviewProvider {
    static var previews: some View {
        Textos()
    }
}


//MARK: - TextField
//Fuente: https://sdos.es/blog/textfield-el-campo-de-texto-editable-de-swiftui

//MARK: - Tipos de teclado
/*
 TextField("keyboardType numberPad", text: .constant(""))
 .keyboardType(.numberPad)
 TextField("keyboardType emailAddress", text: .constant(""))
 .keyboardType(.emailAddress)
 */

//MARK: - Mayusculas
/*
 TextField("Autocapitalization allCharacters", text: .constant(""))
 .autocapitalization(.allCharacters)
 TextField("Autocapitalization words", text: .constant(""))
 .autocapitalization(.words)
 */


//MARK: - Ocultar Teclado
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


//MARK: - Notas
//Cambiar el texto y custom font: https://sarunw.com/posts/swiftui-text-font/


