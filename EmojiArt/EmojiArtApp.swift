//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by lyrisli on 2020/12/31.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: EmojiArtDocument())
        }
    }
}
