//
//  ContentView.swift
//  GGJ2024
//
//  Created by Kauane Santana on 26/01/24.
//

import SwiftUI

struct FrutasView: View {
    @EnvironmentObject var controladorDeFrutas: ControladorDeFrutas
    
    var frutas: [String] = ["🍎", "🍌", "🍊", "🍐"]
    var body: some View {
        ZStack {
            Text("🍎")
                .offset(x:100, y:100)
            Text("🍌")
                .offset(x:123, y:-30)
            Text("🍊")
                .offset(x:-54, y:-5)
            Text("🍐")
                .offset(x:-94, y:-80)
            
        }
        
    }
}

#Preview {
    FrutasView()
        .environmentObject(ControladorDeFrutas())
}


