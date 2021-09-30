//
//  ContentView.swift
//  Memorize
//
//  Created by Irineu Gustavo Peres on 27/09/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚂", "🚜", "🏎", "🚑", "🚗", "🚕", "🚌", "🚎", "🚓", "🚒", "🛴", "🚲", "🛵", "🏍", "✈️", "🚀", "🚁", "⛵️", "🚡", "🚆", "🚤", "🛺", "🚅", "🚈"]
    @State var emojiCount = 4
    var body: some View {
        VStack {
            LazyVGrid (columns: [GridItem(), GridItem(), GridItem()]) {
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            .foregroundColor(Color.purple)
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
                .padding(.top)
                
        }
    }
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
                .padding(.top)
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape
                    .fill(Color.white)
                shape
                    .stroke(lineWidth: 3)
                Text(content).font(Font.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 mini")
        /*ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13 mini")
        */
            
    }
}
