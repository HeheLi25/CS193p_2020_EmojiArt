//
//  EmojiArtDocumentView.swift
//  EmojiArt
//
//  Created by lyrisli on 2020/12/31.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    @ObservedObject var document: EmojiArtDocument
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(EmojiArtDocument.palette.map { String($0) }, id: \.self ) { emoji in
                        Text(emoji)
                            .font(Font.system(size: self.defaultEmojiSize))
                    }
                }
            }
            .padding(.horizontal)
        }
        Rectangle().foregroundColor(.yellow)
            .edgesIgnoringSafeArea([.horizontal, .bottom])
    }
    private let defaultEmojiSize: CGFloat = 40
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiArtDocumentView(document: EmojiArtDocument())
    }
}
