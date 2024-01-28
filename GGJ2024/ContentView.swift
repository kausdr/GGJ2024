//
//  ContentView.swift
//  GGJ2024
//
//  Created by Kauane Santana on 26/01/24.
//

import SwiftUI

struct ContentView: View {
    @State var creditos: Bool = false
    
    var body: some View {
        NavigationStack{
            NavigationLink(destination: GameplayView()){
                Text("Jogar")
            }
            
            NavigationLink(destination: InstructionsView()){
                Text("Instruções")
            }
            
//            NavigationLink(destination: CreditsView()){
//                Text("Créditos")
//            }
            
            Button {
                creditos.toggle()
            } label: {
                Text("Créditos")
            }
        }
        .overlay {
            if creditos {
                CreditsView()
            }
            
            
        }
        
    }
}

#Preview {
    ContentView()
}
