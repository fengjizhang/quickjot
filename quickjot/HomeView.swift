//
//  HomeView.swift
//  quickjot
//
//  Created by Fengji Zhang on 2/24/24.
//

import SwiftUI

struct HomeView: View {
    @State private var enteredText = "TEXT"
    @StateObject private var fetcher = aiParserAPI()
    var body: some View {
        TextEditor(text: $enteredText)
              .padding()
              .font(.title)
              .foregroundColor(.gray)
        Spacer()
            HStack {
                Spacer()
                Button {
                    //if let randomImage = 1 {//fetcher.imageData.sample.randomElement() {
                     //   fetcher.currentPanda = randomImage
                    //}
                    print("HELLO")
                } label: {
                    VStack {
                        Text("+")
                    }
                    .frame(maxWidth: 50, maxHeight: 30)
                    
                }
                .buttonStyle(GrowingButton())
        }
    }
}

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    HomeView()
}
