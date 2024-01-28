//
//  GameplayView.swift
//  GGJ2024
//
//  Created by Kauane Santana on 27/01/24.
//

import SwiftUI

struct GameplayView: View {
    
    var body: some View {
        NavigationStack{
            ZStack {
                BackgroundView()
                FrutasView()
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
        }
        .navigationBarBackButtonHidden()
    }
}

//#Preview {
//    GameplayView()
//        .environmentObject(ControladorDeFrutas())
//}
