//
//  umlunguApp.swift
//  umlungu
//
//  Created by Dan Sivewright on 2023/10/31.
//

import SwiftUI
import SwiftData

@main
struct umlunguApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().modelContainer(for: WordItem.self)
        }
    }
}
