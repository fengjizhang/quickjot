//
//  aiParserAPI.swift
//  quickjot
//
//  Created by Fengji Zhang on 2/24/24.
//

import Foundation

struct OpenAIResponse: Codable {
    let id: String
    let object: String
    let created: Int
    let model: String
}

class aiParserAPI: ObservableObject {

    // Replace with the appropriate OpenAI API URL
    let urlString = "https://api.openai.com/v1/engines/davinci/completions"
    
    enum FetchError: Error {
        case badRequest
        case badJSON
    }
    
    func sendData(textToSend: String) async throws {
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        // Replace "Your-OpenAI-API-Key" with your actual API Key
        request.addValue("Bearer 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", forHTTPHeaderField: "Authorization")
        
        let payload: [String: Any] = [
            "prompt": textToSend,
            "max_tokens": 100 // Adjust based on your needs
        ]
        
        // Encoding your payload to JSON
        request.httpBody = try? JSONSerialization.data(withJSONObject: payload, options: [])
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw FetchError.badRequest
        }

        // Assuming you want to do something with the response data
        // For example, decoding JSON into a Swift object
        // This step depends on what you want to do with the response
        let result = try JSONDecoder().decode(OpenAIResponse.self, from: data)
        print(result)
        
        // Update your state or process the data as needed
    }
}

