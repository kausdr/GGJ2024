//
//  ContentView.swift
//  GGJ2024
//
//  Created by Kauane Santana on 26/01/24.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        NavigationStack{
            NavigationLink(destination: GameplayView()){
                Text("Jogar")
            }
            
            NavigationLink(destination: InstructionsView()){
                Text("Instruções")
            }
            
            NavigationLink(destination: EmptyView()){
                Text("Créditos")
            }
        }
        
    }
}

#Preview {
    ContentView()
}
