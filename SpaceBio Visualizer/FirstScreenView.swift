// FirstScreenView.swift
// SpaceBio Visualizer
//
// Created by Asad Sayeed on 05/10/24.

import SwiftUI

struct FirstScreenView: View {
    @Binding var isFirstScreenShown: Bool // Binding to control the state from MainView
    
    var body: some View {
        VStack(alignment: .center) {
            Image("logo") // Make sure this image is in the asset catalog
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Text("Visualization of data from")
                .font(.largeTitle)
                .opacity(0.75)
                .frame(maxWidth: 200)
                .multilineTextAlignment(.center)
            
            Text("Biological experiments conducted in space")
                .font(.callout)
                .frame(maxWidth: 200)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
        }
        .padding()
        .onTapGesture {
            isFirstScreenShown = false // On tap, hide this screen and show ContentView
        }
    }
}

#Preview {
    FirstScreenView(isFirstScreenShown: .constant(true))
}
