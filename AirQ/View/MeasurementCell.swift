//
//  MeasurementCell.swift
//  AirQ
//
//  Created by Eliseo Martelli on 09/11/20.
//

import SwiftUI

struct MeasurementCell: View {
    var measurement : Measurement
    var body: some View {
        HStack() {
            Text("\(measurement.parameter)").fontWeight(.bold)
            Spacer()
            Text("\(String(format: "%.2f", measurement.value))")
            Text("\(measurement.unit)").font(.footnote)
        }
    }
}


struct MeasurementCell_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementCell(measurement: Measurement(parameter: "pm25", value: 7, unit: "µg/m³"))
    }
}
