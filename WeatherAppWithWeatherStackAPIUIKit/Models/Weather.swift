//
//  Weather.swift
//  WeatherAppWithWeatherStackAPIUIKit
//
//  Created by Камаль Атавалиев on 25.05.2023.
//

import Foundation

// MARK: - Welcome
struct Weather: Codable {
    let location: Location
    let current: Current
}

// MARK: - Current
struct Current: Codable {
    let observationTime: String
    let temperature: Int
    let weatherIcons: [String]
    let weatherDescriptions: [String]
    let visibility: Int
    

    enum CodingKeys: String, CodingKey {
        case observationTime = "observation_time"
        case temperature
        case weatherIcons = "weather_icons"
        case weatherDescriptions = "weather_descriptions"
        case visibility
      
    }
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let country: String
}



