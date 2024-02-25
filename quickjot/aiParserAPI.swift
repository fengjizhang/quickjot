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
    
    let urlString = "https://api.openai.com/v1/engines/davinci/completions"
    
    enum FetchError: Error {
        case badRequest
        case badJSON
    }
    
    func sendData(textToSend: String, completion: @escaping (Result<OpenAIResponse, Error>) -> Void) async {
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer OPEN_API_KEY", forHTTPHeaderField: "Authorization")
        
        let payload: [String: Any] = [
            "prompt": textToSend,
            "max_tokens": 100
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: payload, options: [])
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw FetchError.badRequest
            }
            
            let result = try JSONDecoder().decode(OpenAIResponse.self, from: data)
            completion(.success(result))
        } catch {
            completion(.failure(error))
        }
    }
}
