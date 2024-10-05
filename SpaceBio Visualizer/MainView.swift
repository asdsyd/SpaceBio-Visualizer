// MainView.swift
// SpaceBio Visualizer
//
// Created by Asad Sayeed on 05/10/24.

import SwiftUI

struct MainView: View {
    @State private var isFirstScreenShown = true // State to manage which screen to show
    
    var body: some View {
        if isFirstScreenShown {
            FirstScreenView(isFirstScreenShown: $isFirstScreenShown) // Bind state to control view change
        } else {
            ContentView() // Once tapped, transition to ContentView
        }
    }
}


#Preview {
    MainView()
}
