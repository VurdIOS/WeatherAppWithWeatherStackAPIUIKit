//
//  ChoosingCityViewControllerr.swift
//  WeatherAppWithWeatherStackAPIUIKit
//
//  Created by Камаль Атавалиев on 25.05.2023.
//

import UIKit

class ChoosingCityViewControllerr: UIViewController {
    

    
    
    @IBOutlet var cityTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Choose city"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bioVC = segue.destination as? WeatherViewController else { return }
        bioVC.citiesName = cityTF.text
        
    }
  
    

    @IBAction func searchButtonTapped(_ sender: UIButton) {
        print(cityTF.text ?? "")
        cityTF.text = ""
    }
    
}


