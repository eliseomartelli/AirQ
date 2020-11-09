//
//  Home.swift
//  AirQ
//
//  Created by Eliseo Martelli on 09/11/20.
//

import SwiftUI
import CoreLocation

struct Home: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        if viewModel.data.results.isEmpty {
            ProgressView()
        } else {
            ScrollView() {
                LocationCell(city: viewModel.data.results[0].city, distance: viewModel.data.results[0].distance).padding()
                LazyVStack() {
                    ForEach(viewModel.data.results[0].measurements) { m in
                        MeasurementCell(measurement: m).padding()
                    }
                }
                HStack() {
                    Text("\(viewModel.lat)")
                    Text("•")
                    Text("\(viewModel.long)")
                }.padding()
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
