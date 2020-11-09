//
//  Result.swift
//  AirQ
//
//  Created by Eliseo Martelli on 09/11/20.
//

import Foundation

struct Result: Decodable {

    var city: String
    var distance: Double
    var measurements: [Measurement]
}
