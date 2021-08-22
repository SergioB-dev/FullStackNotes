//
//  DetailView.swift
//  DetailView
//
//  Created by Sergio Bost on 8/21/21.
//

import SwiftUI

struct DetailView: View {
    @State private var counter = 0
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
                    
                        ForEach(note.apiStore){ apiRef in
                            Button(action: { }){
                                Text(" " + apiRef.name + " | ")
                            }
                        }
                }
            }
            HStack {
                Image(systemName: "arrow.left")
                ZStack {
                    Rectangle()
                        .fill(.gray)
                    VStack {
                        Text(note.apiStore[0].codeSnippet?[counter] ?? "")
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.7, height: 300)
                Button(action: { self.counter += 1}) {
                    Image(systemName: "arrow.right")
                }
            }.padding(.vertical)
            Spacer()
            
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(note: MockData.notes[1])
    }
}
