//
//  DetailView.swift
//  DetailView
//
//  Created by Sergio Bost on 8/21/21.
//

import SwiftUI

struct DetailView: View {
    @State private var counter = 0
    @ObservedObject var stateManager: StateManager
    let note: Note
    var body: some View {
        VStack {
            Image(note.language.image)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .padding(.bottom)
            Rectangle()
                .frame(width: UIScreen.main.bounds.width * 0.8, height: 2)
            Text("API's")
            ScrollView(.horizontal) {
                HStack {
                        ForEach(note.apiStore) { apiRef in
                            Button(action: { }, label: {
                                Text(" " + apiRef.name + " | ")
                            })
                        }
                }
            }
            HStack {
                Image(systemName: "arrow.left")
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.gray)
                        .opacity(0.3)
                    VStack {
                        
                        Text(stateManager
                                .beautifyCodeSnippet(word: note.apiStore[0].codeSnippet?[counter] ?? "")
                        )
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.7, height: 300)
                Button(action: { self.counter += 1}, label: {
                    Image(systemName: "arrow.right")
                })
            }.padding(.vertical)
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(stateManager: StateManager(), note: MockData.notes[1])
    }
}
