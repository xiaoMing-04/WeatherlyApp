//
//  Endpoint.swift
//  weatherly
//
//  Created by Nguyễn Minh on 27/8/24.
//

import Foundation

enum Endpoint {
    
    static let baseUrl: String = "https://api.openweathermap.org"
    
    case locationByCityName(String)
    case weatherByLocation(Double, Double)
    
    private var path: String {
        switch self {
        case .locationByCityName(let city):
            return "/geo/1.0/direct?q=\(city)&limit=5&appid=\(Utilities.Constant.key)"
        case .weatherByLocation(let lat, let lon):
            return "/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(Utilities.Constant.key)&units=metric"
        }
    }
    
    static func getEndpointUR(for endpoint: Endpoint) -> URL? {
        let fullPath: String = baseUrl + endpoint.path
        
        return URL(string: fullPath)
    }
}
