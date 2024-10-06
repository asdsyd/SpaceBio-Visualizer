import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            BioItemView() 
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Data")
                }
            
            VisualizationsView()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Visualizations")
                }
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
    @State private var isDescriptionExpanded = false
    @State private var isExperimentsExpanded = false
    @State private var isPayloadsExpanded = false
    @State private var isMissionsExpanded = false
    @State private var isProtocolsExpanded = false
    @State private var isSamplesExpanded = false
    @State private var isAssayExpanded = false
    @State private var isPublicationsExpanded = false
    @State private var isFilesExpanded = false
    @State private var isVersionHistoryExpanded = false
    @State private var isFactorsExpanded = false
    @State private var isOrganismExpanded = false
    @State private var isProjectExpanded = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                SearchBar()
                HStack {
                    Image(systemName: "hare.fill") // Placeholder for the mouse image
                        .resizable()
                        .frame(width: 80, height: 80)
                        .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        Text("OSD-379")
                            .font(.headline)
                        Text("Transcriptional profiling of livers from mice flown on Rodent Research Reference Mission-1 (RRRM-1)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("Version 4")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                
                Group {
                    CollapsibleSection(title: "Description", isExpanded: $isDescriptionExpanded) {
                        Text("""
                            In the Rodent Research Reference Mission (RRRM-1), forty female BALB/cAnNTac mice were flown on the International Space Station. To assess differences in outcomes due to age, twenty 10-12 week-old and twenty 32 week-old mice were flown, respectively. To directly assess spaceflight effects, half of the young and old mice (10 old, 10 young) were sacrificed on-orbit after 22-23 days (ISS Terminal, ISS-T), while the other half (10 old, 10 young) were returned live to Earth after 40 days and allowed to recover for 2 days (Live Animal Return, LAR) before sacrifice.
                            """)
                    }
                    
                    CollapsibleSection(title: "Experiments", isExpanded: $isExperimentsExpanded) {
                        Text("No associated experiments.")
                    }
                    
                    CollapsibleSection(title: "Payloads", isExpanded: $isPayloadsExpanded) {
                        Text("""
                            Identifier: RRRM-1 (RR-8)
                            Type: Space Flight
                            Description: The purpose of the Rodent Research Reference Mission 1 (RRRM-1) was to examine the physiology of aging and its effect on disease progression using groups of young and old mice flown in space and kept on Earth.
                            """)
                    }
                    
                    CollapsibleSection(title: "Missions", isExpanded: $isMissionsExpanded) {
                        Text("""
                            Identifier: SpaceX-16
                            Start Date: 12/04/2018
                            End Date: 01/13/2019
                            """)
                    }
                    
                    CollapsibleSection(title: "Protocols", isExpanded: $isProtocolsExpanded) {
                        Text("Protocols related to spaceflight experiments and data collection.")
                    }
                    
                    CollapsibleSection(title: "Samples", isExpanded: $isSamplesExpanded) {
                        Text("""
                            Sample Source: SpaceX-16
                            Start Date: 12/04/2018
                            End Date: 01/13/2019
                            """)
                    }
                    
                    // Table-based view for Assay information
                    CollapsibleSection(title: "Assay", isExpanded: $isAssayExpanded) {
                        TableView(data: [
                            ("Assay", "Transcription profiling (RNA-Seq)"),
                            ("Platform", "Illumina NovaSeq")
                        ])
                    }
                    
                    // Table-based view for Factors
                    CollapsibleSection(title: "Factors", isExpanded: $isFactorsExpanded) {
                        TableView(data: [
                            ("Factor 1", "Spaceflight"),
                            ("Factor 2", "Duration"),
                            ("Factor 3", "Euthanasia Location"),
                            ("Factor 4", "Dissection Condition"),
                            ("Factor 5", "Age")
                        ])
                    }
                    
                    // Simple organism display
                    CollapsibleSection(title: "Organism", isExpanded: $isOrganismExpanded) {
                        TableView(data: [
                            ("Organism", "Mus musculus (House mouse)")
                        ])
                    }
                    
                    // Table-based view for Project information
                    CollapsibleSection(title: "Project", isExpanded: $isProjectExpanded) {
                        TableView(data: [
                            ("Payload Identifier", "RR-8"),
                            ("Project Title", "Rodent Research-8"),
                            ("Project Type", "Spaceflight Study"),
                            ("Flight Program", "International Space Station (ISS)"),
                            ("Sponsoring Agency", "NASA")
                        ])
                    }
                    
                    CollapsibleSection(title: "Publications", isExpanded: $isPublicationsExpanded) {
                        Text("No associated publications.")
                    }
                    
                    CollapsibleSection(title: "Files", isExpanded: $isFilesExpanded) {
                        Text("Files and datasets related to this study can be accessed through NASA's database.")
                    }
                    
                    CollapsibleSection(title: "Version History", isExpanded: $isVersionHistoryExpanded) {
                        Text("Version 4: Updated with the latest sequencing data and corrections.")
                    }
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

struct CollapsibleSection<Content: View>: View {
    let title: String
    @Binding var isExpanded: Bool
    let content: Content
    
    init(title: String, isExpanded: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self.title = title
        self._isExpanded = isExpanded
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    Text(title)
                        .font(.headline)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                }
                .padding(.vertical, 5)
            }
            if isExpanded {
                content
                    .padding(.leading, 15)
                    .transition(.slide)
            }
        }
        .padding(.vertical, 5)
    }
}

// Custom Table View for Displaying Key-Value Pairs
struct TableView: View {
    let data: [(String, String)]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(data, id: \.0) { item in
                HStack {
                    Text(item.0)
                        .bold()
                        .frame(width: 150, alignment: .leading)
                    Spacer()
                    Text(item.1)
                        .frame(alignment: .leading)
                }
                Divider()
            }
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    ContentView()
}
