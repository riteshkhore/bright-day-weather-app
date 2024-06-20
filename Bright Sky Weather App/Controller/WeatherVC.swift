//
//  ViewController.swift
//  Bright Sky Weather App
//
//  Created by Ritesh Khore on 20/06/24.
//

import UIKit

class WeatherVC: UIViewController {
    
    private lazy var primaryView: CurrentWeatherView = {
       return CurrentWeatherView()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getLocation()
    }
    
    private func getLocation() {
        LocationManager.shared.getCurrentLocation {
            location in
           
            do {
                try WeatherManager.shared.getWeatherForLocation(location: location) {
                    weather in
                  
                }
            } catch {
                print("Error thrown from api")
            }
        }
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(primaryView)
        primaryView.pinSafeArea(parentView: view)
    }

}
