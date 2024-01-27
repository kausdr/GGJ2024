//
//  WinnerView.swift
//  GGJ2024
//
//  Created by Kauane Santana on 27/01/24.
//

import SwiftUI

struct WinnerView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var isActive: Bool
    
    let ganhador: String
    @Binding var path: [Int]
    
    var body: some View {
        VStack {
            Text("PLAYER \(ganhador) GANHOU EEE")
                .navigationBarBackButtonHidden()
            Button("Inicio") {
                presentationMode.wrappedValue.rootPresentationMode?.popToRoot()
            }
        }
    }
    
}

//#Preview {
//    WinnerView(ganhador: "kjkj")
//}
