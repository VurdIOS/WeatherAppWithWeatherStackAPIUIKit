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
        
        let url = network.getURL(city: citiesName)
        
        network.fetchWeather(from: url) { [weak self] result in
            switch result {
            case .success(let weather):
                self?.countryLabel.text = "Country: \(weather.location.country)"
                self?.cityLabel.text = "City: \(weather.location.name)"
                self?.temperatureLabel.text = "Temperature: \(String(weather.current.temperature))"
                self?.discriptionLabel.text = "Discription: \(weather.current.weatherDescriptions[0])"
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.showAlert(withTitle: "You wrote cities name wrong", andMessage: "")
                }
                print(error)
            }
        }
    }
    
}

extension WeatherViewController {
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let gotItAction = UIAlertAction(title: "OK",
                                        style: .default) {_ in
            self.dismiss(animated: true)
        }
        alert.addAction(gotItAction)
        present(alert, animated: true)
    }
}

