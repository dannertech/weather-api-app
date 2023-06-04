//
//  ContentView.swift
//  Weather-App
//
//  Created by Diamonique Danner on 6/2/23.
//

import SwiftUI

enum StateAbbrev: String, CaseIterable, Identifiable {
    case AL,
    AK,
    AZ,
    AR,
    CA,
    CO,
    CT,
    DE,
    FL,
    GA,
    HI,
    ID,
    IL,
    IN,
    IA,
    KS,
    KY,
    LA,
    ME,
    MD,
    MA,
    MI,
    MN,
    MS,
    MO,
    MT,
    NE,
    NV,
    NH,
    NJ,
    NM,
    NY,
    NC,
    ND,
    OH,
    OK,
    OR,
    PA,
    RI,
    SC,
    SD,
    TN,
    TX,
    UT,
    VT,
    VA,
    WA,
    WV,
    WI,
    WY
    
    var id: Self {self}
}

struct ContentView: View {

  
    @State private var selectedState: StateAbbrev = .TX
    //api key 400f71b4f6287778267b62da4e1f8ad9
    @State private var stateCode: String = "";
    @State private var countryCode: Int = 840;
    @State private var state: String = "";
    @State private var city: String = "";
    private var baseUrl = URL(string: "http://api.openweathermap.org/geo/1.0/direct?q=")
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            TextField("Where Are You?", text: $city).textFieldStyle(.roundedBorder)
                .padding()
            Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*/Text("1").tag(1)/*@END_MENU_TOKEN@*/
                /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/
            }
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
