//
//  WinnerView.swift
//  GGJ2024
//
//  Created by Kauane Santana on 27/01/24.
//

import SwiftUI

struct WinnerView: View {
    
    let ganhador: String
    
    var body: some View {
        VStack {
            Text("PLAYER \(ganhador) GANHOU EEE")
                .navigationBarBackButtonHidden()
            Button("Inicio") {
            }
        }
    }
    
}

//#Preview {
//    WinnerView(ganhador: "kjkj")
//}
