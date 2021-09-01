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
                .fontWeight(.bold)
            
            HStack {
                Button(action: {move(forward: false) }, label: {
                    Image(systemName: "arrowtriangle.left.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                })
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.gray)
                        .opacity(0.3)
                    VStack {
                        Text(stateManager
                                .beautifyCodeSnippet(word: note.apiStore[0].codeSnippet?[counter] ?? ""))
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.7, height: 100)
                Button(action: { move(forward: true)}, label: {
                    Image(systemName: "arrowtriangle.right.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                })
            }.padding(.vertical)
            Spacer()
        }
    }
    
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
            DetailView(stateManager: StateManager(), note: MockData.notes[1])
        }
    }
}
