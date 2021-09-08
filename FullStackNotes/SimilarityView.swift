//
//  ConnectionView.swift
//  ConnectionView
//
//  Created by Sergio Bost on 9/8/21.
//

import SwiftUI

struct SimilarityView: View {
    @EnvironmentObject var stateManager: StateManager
    let compareeNoteImage: String
    let comparerNoteImage: String
    var body: some View {
        VStack {
            HStack {
                Image(compareeNoteImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                Rectangle()
                    .frame(height: 2)
                Image(comparerNoteImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
            }.padding()
            SimilarityRowView(similarities: arrayExamples,
                              primaryName: "List", secondaryName: "Array")
            Divider()
                .padding(.bottom)
            SimilarityRowView(similarities: stringExamples,
                              primaryName: "String", secondaryName: "String")
            Divider()
                .padding(.bottom)
            SimilarityRowView(similarities: dictionaryExamples,
                              primaryName: "Dictionary", secondaryName: "Dictionary")
            Divider()
                .padding(.bottom)
            
            Spacer()
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(compareeNoteImage.capitalized + "-" + comparerNoteImage.capitalized)
        }
    }

    private let arrayExamples = ["Append", "Deletion", "Find", "Init", "Prepend", "Pop"]
    private let stringExamples = ["Reverse", "Capitalize", "Uppercase"]
    private let dictionaryExamples = ["Add KV Pair"]
}

struct SimilarityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SimilarityView(compareeNoteImage: "python", comparerNoteImage: "swift")
                .environmentObject(StateManager())
        }
    }
}

struct SimilarityRowView: View {
    @EnvironmentObject var stateManager: StateManager
    
    let similarities: [String]
    let primaryName: String
    var secondaryName: String
    
    var body: some View {
        Group {
            HStack {
                Text(primaryName).underline(true, color: .black)
                    .bold()
                    .font(.title2)
                Spacer()
                Image(systemName: "star.fill")
                Spacer()
                Text(secondaryName).underline(true, color: .black)
                    .bold()
                    .font(.title2)
            }.padding(.horizontal, 25)
            LazyVGrid(columns: gridStyle) {
                ForEach(Array(similarities.enumerated()), id: \.element) { index, example in
                    Button(action: { }, label: {
                    Text(example)
                        .bold()
                        .frame(width: 80)
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                        .padding()
                        .background(colors[index % similarities.count])
                        .cornerRadius(10)
                        .padding(.vertical, 8)
                    })
                    
                }
            }
        }
    }
    private let colors: [Color] = [.indigo, .mint, .red, .pink, .purple, .blue, .teal, .orange, .green, .cyan]
    private let gridStyle = [GridItem(.flexible(minimum: 120, maximum: 120), spacing: 20),
                             GridItem(.flexible(minimum: 120, maximum: 120), spacing: 20),
                             GridItem(.flexible(minimum: 120, maximum: 120), spacing: 20)]
}
