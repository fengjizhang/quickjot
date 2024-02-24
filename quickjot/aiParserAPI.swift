//
//  aiParserAPI.swift
//  quickjot
//
//  Created by Fengji Zhang on 2/24/24.
//

import Foundation
import SwiftUI


class aiParserAPI: ObservableObject {
    @Published var imageData = 1
    @Published var currentPanda = 2
    
    let urlString = "http://playgrounds-cdn.apple.com/assets/pandaData.json"
    
    enum FetchError: Error {
        case badRequest
        case badJSON
    }
    
     func fetchData() async
     throws  {
        guard let url = URL(string: urlString) else { return }


        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badRequest }


        //Task { @MainActor in
        //    imageData = try JSONDecoder().decode(PandaCollection.self, from: data)
        //}
    }
    
}
