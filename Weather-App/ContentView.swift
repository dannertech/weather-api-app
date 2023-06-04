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

struct Coords: Decodable {
    let name: String
    let lat: Double
    let lon: Double
}



struct ContentView: View {

  
    @State private var selectedState: StateAbbrev = .TX
    
    @State private var stateCode: String = StateAbbrev.TX.rawValue;
    @State private var countryCode: Int = 840;
    @State private var state: String = "";
    @State private var city: String = "";
    @State private var errorMessage: String = "";
    
    private var baseUrlWeather = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=")
    
    func fetchCoords() async throws -> [Coords] {
        if(city == ""){
            errorMessage = "Please input a valid city";
            return [];
        }
        let baseUrlCoords = URL(string: "http://api.openweathermap.org/geo/1.0/direct?q=\(city),\(stateCode),\(countryCode)&appid=400f71b4f6287778267b62da4e1f8ad9")!
        do {
            errorMessage = "";
            let (data,response) = try await URLSession.shared.data(from: baseUrlCoords)
            let decoded = try JSONDecoder().decode([Coords].self, from: data)
            
             print(decoded);
             
            return decoded;
        } catch {
            
            print(error)
            
            return []
        }
        
      
    }
    
    func buttonPressed (){
        
        Task {
            let response = try await fetchCoords()
        }
        
            
        
         
    }
    var body: some View {
        VStack {
            errorMessage.count > 0 ? Text("Please input a valid city") : Text("")
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            TextField("Where Are You?", text: $city).textFieldStyle(.roundedBorder)
                .padding()
            Picker("State", selection: $selectedState) {
                ForEach(StateAbbrev.allCases){ state in
                    Text(state.rawValue)
                }
                
            }
            Button("Submit"){
                buttonPressed()
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
