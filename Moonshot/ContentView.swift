//
//  ContentView.swift
//  Moonshot
//
//  Created by Bruce Gilmour on 2021-07-11.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    var body: some View {
        HStack {
            Spacer()
            Text("\(astronauts.count)")
            Spacer()
            Text("\(missions.count)")
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
