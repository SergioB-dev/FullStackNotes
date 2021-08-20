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

            List(MockData.notes) { note in
                Text(note.title)
            }
            .padding()
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { }, label: {
                            Image(systemName: "plus")
                    })
                }
            }
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
