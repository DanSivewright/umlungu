//
//  ContentView.swift
//  umlungu
//
//  Created by Dan Sivewright on 2023/10/31.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showCreate = false
    @Query private var words: [WordItem]
    @Environment(\.modelContext) var context

    var body: some View {
        NavigationStack {
            List {
                ForEach(words) { word in
                    Card(word: word)
                }
            }
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        showCreate.toggle()
                    }, label: {
                        Label("Add Word", systemImage: "plus")
                    })
                }
            }
            .sheet(isPresented: $showCreate, content: {
                NavigationStack {
                    CreateWord()
                }
                .presentationDetents([.medium])
            })
        }
    }
}

struct Card: View {
    let word: WordItem
    @State private var isExpanded = false
    var body: some View {
        VStack (alignment: .leading, content: {
            if isExpanded {
                Text(word.translation).foregroundColor(.white).padding(16).font(.system(size: 36, weight: .bold)).zIndex(1)
            } else {
                Text(word.word).foregroundColor(.white).padding(16).font(.system(size: 36, weight: .bold))
            }
            
            Spacer()
            HStack {
                Text(word.language).foregroundColor(.white).zIndex(1)
                Spacer()
                Circle().fill(Color.blue).frame(width: 20).scaleEffect(isExpanded ? 60 : 1).zIndex(0)
            }
            .onTapGesture {
                withAnimation {
                    isExpanded.toggle()
                }
            }
        }).clipped().swipeActions{
            Button(role: .destructive, action: {}, label: {
                Label("Delete", systemImage: "trash").symbolVariant(.fill)
            })
        }
    }
}

#Preview {
    ContentView()
}
