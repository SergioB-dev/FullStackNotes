//
//  DetailView.swift
//  DetailView
//
//  Created by Sergio Bost on 8/21/21.
//

import SwiftUI

struct DetailView: View {
    @State private var counter = 0
    @EnvironmentObject var stateManager: StateManager
    let note: Note
    var body: some View {
        VStack {
            Image(note.language.image)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
            Group {
                HStack {
                    Text("Similarities").bold()
                    Text("**to:**")
                        .foregroundColor(.indigo)
                }
                .font(.title2)
                .padding(.top)
            Rectangle()
                .frame(width: 150, height: 2)
                
                LazyVGrid(columns: gridStyle) {
                    ForEach(Language.allCases) { language in
                        if language != note.language {
                            NavigationLink(destination:
                                            SimilarityView(compareeNoteImage: note.language.image,
                                                           comparerNoteImage: language.image)) {
                            Image(language.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 80)
                                .padding()
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            .padding(.horizontal)
            Spacer()
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(note.language.image.capitalized)
        }
    }
    private let gridStyle = [GridItem(), GridItem(), GridItem()]
    
    private func move(forward: Bool) {
        if forward {
            self.counter += 1
        } else {
            guard counter > 0 else { return }
            self.counter -= 1
        }

    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(note: MockData.notes[1])
                .environmentObject(StateManager())
        }
    }
}
