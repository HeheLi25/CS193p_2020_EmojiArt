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
            //.overlay(Image(self.document.backgroundImage))
            .edgesIgnoringSafeArea([.horizontal, .bottom])
            .onDrop(of: ["public.image"], isTargeted: nil) { providers, location in
                return self.drop(providers: providers)
            }
    }
    
    private func drop(providers: [NSItemProvider])  -> Bool {
        let found = providers.loadFirstObject(ofType: URL.self) { url in
            print("dropped \(url)")
            self.document.setBackGroundURL(url)
        }
        return found
    }
    
    private let defaultEmojiSize: CGFloat = 40
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiArtDocumentView(document: EmojiArtDocument())
    }
}
