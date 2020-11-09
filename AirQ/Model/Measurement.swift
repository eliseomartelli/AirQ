//
//  Measurement.swift
//  AirQ
//
//  Created by Eliseo Martelli on 09/11/20.
//

import Foundation

struct Measurement: Decodable, Identifiable {
    var id = UUID().uuidString
    
    var parameter: String
    var value: Double
    var unit: String
    
    private enum CodingKeys: String, CodingKey { case parameter, value, unit }
}
