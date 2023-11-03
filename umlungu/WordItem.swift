//
//  WordItem.swift
//  umlungu
//
//  Created by Dan Sivewright on 2023/10/31.
//

import Foundation
import SwiftData

@Model
final class WordItem {
    var word: String
    var translation: String
    var language: String
    
    init(word: String = "", language: String = "", translation: String = "") {
        self.word = word
        self.translation = translation
        self.language = language
    }
}
