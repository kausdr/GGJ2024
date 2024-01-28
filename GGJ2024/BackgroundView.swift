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
            Image("background")
                .resizable()
//                .frame(width:633, height: 291)
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
//            Image(.pombo01)
//                .resizable()
//                .frame(width:204, height: 231)
//                .offset(y: 10)
//                .imageScale(/*@START_MENU_TOKEN@*/.medium/*@END_MENU_TOKEN@*/)
//                .aspectRatio(contentMode: .fill)
//                .padding(48)
            
        }
    }
}

#Preview {
    BackgroundView()
}
