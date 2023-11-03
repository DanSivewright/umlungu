//
//  CreateWord.swift
//  umlungu
//
//  Created by Dan Sivewright on 2023/10/31.
//

import SwiftUI

struct CreateWord: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State private var word = WordItem()
    var body: some View {
        List {
            TextField("Word", text: $word.word)
            TextField("Translation", text: $word.translation)
            TextField("Language", text: $word.language)
            Button("Create") {
                withAnimation {
                    context.insert(word)
                }
                dismiss()
            }
        }.navigationTitle("Create Word")
    }
}

#Preview {
    CreateWord()
        .modelContainer(for: WordItem.self)
}
