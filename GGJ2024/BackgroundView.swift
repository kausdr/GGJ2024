//
//  ContentView.swift
//  GGJ2024
//
//  Created by Kauane Santana on 26/01/24.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Text("background com a pombaaa")
            Image("praca")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            Image("pombo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(48)
            
        }
    }
}

#Preview {
    BackgroundView()
}
