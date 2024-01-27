//
//  CreditsView.swift
//  GGJ2024
//
//  Created by Andrea Oquendo on 27/01/24.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack{
            Text("Creditos")
                .font(.largeTitle)
            
            Text("O jogo inteiro foi feito por:\nandi\nmari\nkau")
                .multilineTextAlignment(.center)
            
        }
    }
}

#Preview {
    CreditsView()
}
