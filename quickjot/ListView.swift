//
//  ListView.swift
//  quickjot
//
//  Created by Fengji Zhang on 2/24/24.
//

import SwiftUI

struct ListView: View {
@StateObject private var eventData = EventData()
    
    var body: some View {
        NavigationView {
            EventList()
            Text("Select an Event")
                .foregroundStyle(.secondary)
        }
        .environmentObject(eventData)
    }
}
