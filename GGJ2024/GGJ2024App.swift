//
//  GGJ2024App.swift
//  GGJ2024
//
//  Created by Kauane Santana on 26/01/24.
//

import SwiftUI

@main
struct GGJ2024App: App {
    
    @StateObject var controladorDeFrutas = ControladorDeFrutas()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(controladorDeFrutas)
        }
    }
}
