//
//  ContentView.swift
//  Weather-App
//
//  Created by Diamonique Danner on 6/2/23.
//

import SwiftUI
struct Current: Decodable {
    var temperature: Int = 0;
    var weatherDescription: String = "It's Zero"
}

struct ContentView: View {
    struct Weather: Decodable {
        let current: Current;
    }
//api key 699463c71425774794752ac6655624d5
    let url = URL(string: "https://api.weatherstack.com/current?access_key=699463c71425774794752ac6655624d5&query=")
    
@State private var city: String = "";
    
@State var current: Current = Current();
    

    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
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
