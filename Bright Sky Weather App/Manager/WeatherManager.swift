//
//  WeatherManager.swift
//  Bright Sky Weather App
//
//  Created by Ritesh Khore on 20/06/24.
//

import Foundation
import WeatherKit
import CoreLocation

final class WeatherManager: NSObject {
    static let shared = WeatherManager()
    
    public func getWeatherForLocation(location:CLLocation, completion:@escaping(WeatherModel) -> Void) throws {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=9d01b936286ccf4c0c24d70a3b9b53c4") else {
            fatalError("Invalid url!!")
        }
        
        print(location.coordinate)
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: {
            (data, response, error) in
            if let error = error {
                print("Api error", error)
                fatalError("API Error!")
            }
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data")
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode(WeatherModel.self, from: data)
                    print(decoded)
                    completion(decoded)
                } catch let e {
                    print(e)
                    print("Conversion error!!!")
                }
            }
        })
        
        task.resume()
    }
}
