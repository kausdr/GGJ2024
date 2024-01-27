//
//  ContentView.swift
//  GGJ2024
//
//  Created by Kauane Santana on 26/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var path: [Int] = []
    
    var body: some View {
        NavigationStack{
            NavigationLink(destination: GameplayView(path:$path)){
                Text("Jogar")
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
