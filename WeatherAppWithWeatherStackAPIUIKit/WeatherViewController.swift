//
//  WeatherViewController.swift
//  WeatherAppWithWeatherStackAPIUIKit
//
//  Created by Камаль Атавалиев on 25.05.2023.
//

import UIKit

class WeatherViewController: UIViewController {
    
    
    
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var discriptionLabel: UILabel!
    
    var citiesName: String!
    
    
    private let network = NetworkManager.shared
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(citiesName!)
        network.fetchWeather(from: getURL(city: citiesName)) { [weak self] result in
            switch result {
            case .success(let weather):
                self?.countryLabel.text = weather.location.country
                self?.cityLabel.text = weather.location.name
                self?.temperatureLabel.text = String(weather.current.temperature)
                self?.discriptionLabel.text = weather.current.weatherDescriptions[0]
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.discriptionLabel.text = "incorrect city"
                }
                
                print(error)
            }
        }
    }
    
    private func getURL(city: String) -> URL {
        let url = "http://api.weatherstack.com/current?access_key=c414a7f553e3b40344a3d8ff36490ac5&query=\(city)"
        return URL(string: url)!
    }
    

}
