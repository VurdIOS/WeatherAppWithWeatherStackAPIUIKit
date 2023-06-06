//
//  NetworkManager.swift
//  WeatherAppWithWeatherStackAPIUIKit
//
//  Created by Камаль Атавалиев on 25.05.2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private let url = URL(string: "http://api.weatherstack.com/current?access_key=c414a7f553e3b40344a3d8ff36490ac5&query=Bishkek")
    
    
    func fetchWeather(from url: URL, completion: @escaping(Result<Weather, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "New error")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let weather = try decoder.decode(Weather.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(weather))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    //
    func getURL(city: String) -> URL {
        let url = "http://api.weatherstack.com/current?access_key=d819b479ba5a4c3c7ee27df4b404ba44&query=\(city)"
        return URL(string: url)!
    }
}

