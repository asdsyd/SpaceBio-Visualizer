// ContentView.swift
// SpaceBio Visualizer
//
// Created by Asad Sayeed on 05/10/24.

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DataView() // List view
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Data")
                }
            
            Text("Visualizations") // Placeholder for visualizations
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Visualizations")
                }
        }
    }
}

struct DataView: View {
    var body: some View {
        VStack {
            SearchBar() // Search bar for data
            
            List {
                ForEach(0..<3) { _ in
                    BioItemView() // Displaying bio items
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

struct SearchBar: View {
    @State private var searchText = ""
    
    var body: some View {
        TextField("Search", text: $searchText)
            .padding(7)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 10)
    }
}

struct BioItemView: View {
    var body: some View {
        HStack {
            Image(systemName: "hare.fill") // Placeholder image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Rectangle())
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                Text("OSD-379")
                    .font(.headline)
                
                Text("In the Rodent Research Ref...")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Button(action: {
                // Action for "Read More" button
            }) {
                Text("Read More")
                    .padding(10)
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

#Preview {
    ContentView()
}
