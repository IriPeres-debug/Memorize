//
//  ContentView.swift
//  Memorize
//
//  Created by Irineu Gustavo Peres on 27/09/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚂", "🚜", "🏎", "🚑", "🚗", "🚕", "🚌", "🚎", "🚓", "🚒", "🛴", "🚲", "🛵", "🏍", "✈️", "🚀", "🚁", "⛵️", "🛸", "🚆", "🚤", "🛺", "🚅", "🚈"]
    @State var emojiCount = 24
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid (columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
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
                .padding(.vertical)
                
        }
    }
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
                .padding(.vertical)
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
                    .strokeBorder(lineWidth: 3)
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
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13 mini")
//.previewInterfaceOrientation(.landscapeLeft)
        /*ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13 mini")
        */
            
    }
}
