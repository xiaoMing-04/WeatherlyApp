//
//  APIClient.swift
//  weatherly
//
//  Created by Nguyễn Minh on 27/8/24.
//

import Foundation


struct LocationAPIClient {
    
    static func decodeByCityName(city: String) async throws -> Location? {
        guard let url = Endpoint.getEndpointUR(for: Endpoint.locationByCityName(city)) else {
            throw NetworkError.invalidUrl("invalid url")
        }
                
        let (data, response) = try await URLSession.shared.data(from: url)
        
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse("invalid response")
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let location = try decoder.decode([Location].self, from: data)
            
            return location.first
            
        } catch {
            throw NetworkError.invalidData("invalid data")
        }
    }
}
