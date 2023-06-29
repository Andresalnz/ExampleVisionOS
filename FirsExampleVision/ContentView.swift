//
//  ContentView.swift
//  FirsExampleVision
//
//  Created by Andres Aleu on 27/6/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State var viewModel = RickAndMortyViewModel()
    
    var body: some View {
        NavigationSplitView {
            List(viewModel.characters) { character in
                NavigationLink(destination: DetailView(character: character)) {
                    HStack {
                        AsyncImage(url: character.image ?? URL(string: "")) { image in
                            image
                                .resizable()
                                .frame(width: 145,height: 145, alignment: .center)
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        VStack(alignment: .leading, spacing: 10) {
                            Group {
                                Text(character.name ?? "N/A")
                                    .font(.title)
                                    .bold()
                                Text(character.species?.rawValue ?? "N/A")
                                    .font(.title2)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Personajes")
        } detail: {
            VStack {
              Text("Elige un personaje")
            }
        }

        .padding()
        .ornament(attachmentAnchor: .scene(alignment: .bottom)) {
            VStack {
                Text("Detalle del personaje")
            }
            .frame(width: 400, height: 60)
            .background(.green)
            .glassBackgroundEffect()
            
        }
        
        
    }
        
}

#Preview {
    ContentView()
}
