//
//  Weather.swift
//  weatherly
//
//  Created by Nguyễn Minh on 27/8/24.
//

import Foundation

struct WeatherResponse: Decodable {
    var main: Weather
}


struct Weather: Decodable {
    var temp: Double
}
