//
//  WeatherAPIClient.swift
//  weatherly
//
//  Created by Nguyễn Minh on 28/8/24.
//

import Foundation


struct WeatherAPIClient {
    static func decodeByLocation(lat: Double, lon: Double) async throws -> Weather? {
        guard let url = Endpoint.getEndpointUR(for: Endpoint.weatherByLocation(lat, lon)) else {
            throw NetworkError.invalidUrl("invalid url")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse("invalid response")
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
            
            return weatherResponse.main
        } catch {
            throw NetworkError.invalidData("invalid data")
        }
    }
}
