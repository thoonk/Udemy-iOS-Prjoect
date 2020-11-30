//
//  WeatherData.swift
//  Clima
//
//  Created by 김태훈 on 2020/11/30.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
    
    
}

struct Weather: Decodable {
    let id: Int
    let description: String
}
