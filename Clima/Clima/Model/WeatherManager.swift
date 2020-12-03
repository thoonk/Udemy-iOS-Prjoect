//
//  WeatherManager.swift
//  Clima
//
//  Created by 김태훈 on 2020/11/29.
//  Copyright © 2020 App Brewery. All rights reserved.


import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(_ error: Error)
}


struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=APIKey&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longtitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longtitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        // 1. URL 만들기
        if let url  = URL(string: urlString) {
            // 2. URLSession 만들기
            let session = URLSession(configuration: .default)
            // 3. session에 task 할당
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
//                    print(error!)
                    self.delegate?.didFailWithError(error!)
                    // exit out of this function
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
//                        let weatherVC = WeatherViewController()
//                        weatherVC.didUpdateWeather(weather: weather)
                        
                        // 클로저 안에서 바깥 변수 사용시 self 붙이기
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
//                    let dataString = String(data: safeData, encoding: .utf8)
//                    print(dataString)
                }
            }
            // 4. task 시작
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try! decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
}
