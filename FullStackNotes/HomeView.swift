//
//  ContentView.swift
//  FullStackNotes
//
//  Created by Sergio Bost on 8/18/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var stateManager: StateManager
    var body: some View {
        VStack {
            Picker("", selection: $stateManager.displayChoice) {
                ForEach(DisplayChoice.allCases) { choice in
                    Text(choice.rawValue).tag(choice)
                }
            }.pickerStyle(.segmented)

            List {
                ForEach(MockData.notes) { note in
                    NavigationLink(destination: DetailView(note: note)) {
                        VStack(alignment: .leading) {
                                HStack {
                                    Image(note.language.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 30)
                                        .padding(.bottom, 5)
                                    Divider()
                                    Text(note.title)
                                        .bold()
                                    Spacer()
                                    showCodeSnippetIfPresent(note: note)
                                }
                                
                        }
                    }
                    
                    
                }
               
                

            }
            .listStyle(.inset)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { }, label: {
                            Image(systemName: "plus")
                    })
                }
        }
        }
        
    }
    @ViewBuilder private func showCodeSnippetIfPresent(note: Note) -> some View {
        if note.hasCodeSnippets {
            Image(systemName: "chevron.left.slash.chevron.right")
                .foregroundColor(.green)
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .environmentObject(StateManager())
        }
    }
}
