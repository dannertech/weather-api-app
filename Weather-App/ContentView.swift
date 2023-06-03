//
//  ContentView.swift
//  Weather-App
//
//  Created by Diamonique Danner on 6/2/23.
//

import SwiftUI

struct ContentView: View {
    //api key 400f71b4f6287778267b62da4e1f8ad9
    @State private var countryCode: Int = 840;
    @State private var city: String = "";
    private var baseUrl = URL(string: "http://api.openweathermap.org/geo/1.0/direct?q=")
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            TextField("Where Are You?", text: $city).textFieldStyle(.roundedBorder)
                .padding()
            Button("Submit") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
