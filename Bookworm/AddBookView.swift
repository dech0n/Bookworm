//
//  AddBookView.swift
//  Bookworm
//
//  Created by Dechon Ryan on 5/29/24.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var isNotValidBookEntry: Bool {
        if title.isEmptyOrBlank
            || author.isEmptyOrBlank
            || genre.isEmptyOrBlank
            || review.isEmptyOrBlank {
            return true
        }
        
        return false
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                
                Section {
                    HStack {
                        Spacer()
                        Button("Save") {
                            let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                            modelContext.insert(newBook)
                            dismiss()
                        }
                        .disabled(isNotValidBookEntry)
                        Spacer()
                    }
                }
            }
        }
        .navigationTitle("Add Book")
    }
    
}


#Preview {
    AddBookView()
}
