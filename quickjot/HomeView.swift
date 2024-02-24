//
//  HomeView.swift
//  quickjot
//
//  Created by Fengji Zhang on 2/24/24.
//

import SwiftUI

struct HomeView: View {
    @State private var enteredText = "Type something..."
    var body: some View {
        TextEditor(text: $enteredText)
              .padding()
              .font(.title)
              .foregroundColor(.gray)
    }
}

#Preview {
    HomeView()
}
