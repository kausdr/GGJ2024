//
//  ContentView.swift
//  GGJ2024
//
//  Created by Kauane Santana on 26/01/24.
//

import SwiftUI

struct BotoesView: View {
    var body: some View {
        HStack {
            Button{
                
            } label: {
                Text("UVA")
            }
            .frame(width: 100, height: 100)
            .background(.red)
            .cornerRadius(50)
            
            Spacer()
            
            Button{
                
            } label: {
                Text("UVA")
            }
            .frame(width: 100, height: 100)
            .background(.red)
            .cornerRadius(50)
            
        }
    }
}

#Preview {
    BotoesView()
}
