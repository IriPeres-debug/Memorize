//
//  ContentView.swift
//  Memorize
//
//  Created by Irineu Gustavo Peres on 27/09/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚂", "🚜", "🏎", "🚑"]
    
    var body: some View {
        HStack {
            CardView(content: emojis[0])
            CardView(content: emojis[1])
            CardView(content: emojis[2])
            CardView(content: emojis[3])

        }
            .padding()
            .foregroundColor(Color.purple)
            .font(Font.largeTitle)
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
                Text(content)
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
