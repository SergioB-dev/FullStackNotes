//
//  Note.swift
//  Note
//
//  Created by Sergio Bost on 8/19/21.
//

import Foundation

struct Note: Identifiable {
    
    let title: String
    let body: String
    let category: String
    private var favorite = false
    internal let id = UUID()
    
    init(title: String, body: String, category: String) {
        self.title = title
        self.body = body
        self.category = category
    }
    
    mutating func makeFavorite() {
        self.favorite = true
    }
    
    mutating func unFavorite() {
        self.favorite = false
    }
    
    
}

// Should we keep the long body with Lorem Ipsum?

struct MockData {
    static let notes = [
        Note(title: "WWDC 2021 - SwiftUI", body: "SwiftUI views all either have an implicit ID or an explicit one. This way SwiftUI knows which view to re-render during state change", category: "WWDC"),
        Note(title: "Lorem Ipsum", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sed massa venenatis, pharetra erat elementum, volutpat dui. Integer elementum efficitur tempus. Nam in fringilla neque. Donec lacinia lacinia feugiat. Cras venenatis, tellus gravida gravida imperdiet, quam nulla rutrum nisi, vel blandit mauris nisl id ipsum. Mauris convallis odio tortor, in facilisis augue molestie vitae. Vivamus sollicitudin justo sit amet dolor facilisis iaculis. Cras pulvinar augue velit, non rutrum elit tincidunt in. Fusce pulvinar ligula vitae dapibus pretium. Sed sit amet dui facilisis, fringilla tortor id, rhoncus ex. Vestibulum ut massa elit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris eu mauris id tortor varius venenatis. Mauris a metus lorem. Fusce sed lectus commodo, tristique nisi facilisis, sodales est. Sed quam arcu, lobortis vitae elit eu, varius dictum leo.", category: "Personal"),
        Note(title: "Math notes", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sed massa venenatis, pharetra erat elementum, volutpat dui. Integer elementum efficitur tempus. Nam in fringilla neque. Donec lacinia lacinia feugiat. Cras venenatis, tellus gravida gravida imperdiet, quam nulla rutrum nisi, vel blandit mauris nisl id ipsum. Mauris convallis odio tortor, in facilisis augue molestie vitae. Vivamus sollicitudin justo sit amet dolor facilisis iaculis. Cras pulvinar augue velit, non rutrum elit tincidunt in. Fusce pulvinar ligula vitae dapibus pretium. Sed sit amet dui facilisis, fringilla tortor id, rhoncus ex. Vestibulum ut massa elit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris eu mauris id tortor varius venenatis. Mauris a metus lorem. Fusce sed lectus commodo, tristique nisi facilisis, sodales est. Sed quam arcu, lobortis vitae elit eu, varius dictum leo.",  category: "Study"),
        Note(title: "Cat World Domination", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sed massa venenatis, pharetra erat elementum, volutpat dui. Integer elementum efficitur tempus. Nam in fringilla neque. Donec lacinia lacinia feugiat. Cras venenatis, tellus gravida gravida imperdiet, quam nulla rutrum nisi, vel blandit mauris nisl id ipsum. Mauris convallis odio tortor, in facilisis augue molestie vitae. Vivamus sollicitudin justo sit amet dolor facilisis iaculis. Cras pulvinar augue velit, non rutrum elit tincidunt in. Fusce pulvinar ligula vitae dapibus pretium. Sed sit amet dui facilisis, fringilla tortor id, rhoncus ex. Vestibulum ut massa elit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris eu mauris id tortor varius venenatis. Mauris a metus lorem. Fusce sed lectus commodo, tristique nisi facilisis, sodales est. Sed quam arcu, lobortis vitae elit eu, varius dictum leo.", category: "Feline"),
        
        
    ]
}
