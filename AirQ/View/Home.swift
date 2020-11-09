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
        NavigationView {
            if viewModel.data.results.isEmpty {
                ProgressView()
            } else {
                ScrollView() {
                    LocationCell(city: viewModel.data.results[0].city, distance: viewModel.data.results[0].distance).padding()
                    LazyVStack() {
                        ForEach(viewModel.data.results[0].measurements) { m in
                            MeasurementCell(measurement: m).padding()
                            Divider()
                        }
                    }
                    Text("\(viewModel.lat) • \(viewModel.long)")
                        .padding()
                        .font(.footnote)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                }
                .navigationBarTitle("AirQ")
                .navigationBarItems(trailing:
                    Button("Refresh") {
                        viewModel.fetch()
                    }
                )
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
