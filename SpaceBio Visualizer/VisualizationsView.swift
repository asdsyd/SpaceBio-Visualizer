//
//  VisualizationsView.swift
//  SpaceBio Visualizer
//
//  Created by Asad Sayeed on 06/10/24.
//

import SwiftUI

struct VisualizationsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image("totalSequences")
                    .resizable()
                    .scaledToFit()
                    .frame(height: UIScreen.main.bounds.height / 2)
                
                Image("percentDuplicates")
                    .resizable()
                    .scaledToFit()
                    .frame(height: UIScreen.main.bounds.height / 2)
                
                Image("regressionLine")
                    .resizable()
                    .scaledToFit()
                    .frame(height: UIScreen.main.bounds.height / 2)
                
                Image("boxPlot")
                    .resizable()
                    .scaledToFit()
                    .frame(height: UIScreen.main.bounds.height / 2)
                
                Image("heatmap")
                    .resizable()
                    .scaledToFit()
                    .frame(height: UIScreen.main.bounds.height / 2)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    VisualizationsView()
}

