//
//  CoinData.swift
//  ByteCoin
//
//  Created by 김태훈 on 2020/12/04.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let assetIdBase: String
    let assetIdQuote: String
    let time: String
    let rate: Double
    
    var rateString: String {
        return String(format: "%.2f", rate)
    }
    
    enum CodingKeys: String, CodingKey {
        case assetIdBase = "asset_id_base"
        case assetIdQuote = "asset_id_quote"
        case time, rate
    }
    
    
}
