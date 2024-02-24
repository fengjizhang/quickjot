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
        .buttonStyle(.bordered)
        .controlSize(.large)
    }
}

#Preview {
    HomeView()
}
