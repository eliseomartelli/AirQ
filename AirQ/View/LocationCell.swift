//
//  LocationCell.swift
//  AirQ
//
//  Created by Eliseo Martelli on 09/11/20.
//

import SwiftUI

struct LocationCell: View {
    var city: String
    var distance: Double
    var body: some View {
        VStack() {
            Text("\(city)").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("\(distance/1000) Km").opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
        }
    }
}

struct LocationCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationCell(city: "Pescara", distance: 1)
    }
}
