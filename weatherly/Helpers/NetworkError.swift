//
//  NetworkError.swift
//  weatherly
//
//  Created by Nguyễn Minh on 27/8/24.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl(String)
    case invalidResponse(String)
    case invalidData(String)
}
