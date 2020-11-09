//
//  ContentView.swift
//  AirQ
//
//  Created by Eliseo Martelli on 09/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView() {
            Home().navigationBarTitle("AirQ")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

