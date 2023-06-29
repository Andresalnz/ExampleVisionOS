//
//  DetailView.swift
//  FirsExampleVision
//
//  Created by Andres Aleu on 27/6/23.
//

import SwiftUI

struct DetailView: View {
    
    var character: CharacterInfoDTO
    var body: some View {
        VStack {
            AsyncImage(url: character.image ?? URL(string: "")) { image in
                image
                    .resizable()
                    .frame(width: 300, height: 300, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke( .black, lineWidth: 4))
                    .shadow(radius: 5)
                    .padding(.top, 80)
            } placeholder: {
                ProgressView()
            }
            Text(character.name ?? "N/A")
            List {
                HStack {
                    Label("Especie", systemImage: "figure.arms.open")
                        .padding()
                    Text(character.species?.rawValue ?? "N/A")
                    Spacer()
                    Label("Nombre", systemImage: "figure.arms.open")
                        .padding()
                    Text(character.name ?? "N/A")
                }
            }
            .listStyle(.plain)
            .scrollDisabled(true)
            .padding(.horizontal, 20)
            
        }
    }
}

#Preview {
    DetailView(character: CharacterInfoDTO(id: 1, name: "Andres", image: URL(string: ""), species: .Animal))
}
