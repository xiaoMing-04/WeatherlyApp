//
//  Location.swift
//  weatherly
//
//  Created by Nguyễn Minh on 27/8/24.
//

import Foundation

struct Location: Decodable {
    var name: String
    var lat: Double
    var lon: Double
}
