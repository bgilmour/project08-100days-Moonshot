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

    @State private var showingLaunchDate = true

    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)

                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        if showingLaunchDate {
                            Text(mission.formattedLaunchDate)
                        } else {
                            Text(crewNames(mission).joined(separator: ", "))
                        }
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(
                trailing:
                    Button(showingLaunchDate ? "Show Crew" : "Show Date") {
                        showingLaunchDate.toggle()
                    }
            )
        }
    }

    func crewNames(_ mission: Mission) -> [String] {
        var names = [String]()

        for member in mission.crewIds {
            if let astronaut = astronauts.first(where: { $0.id == member }) {
                names.append(astronaut.name)
            }
        }

        return names
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
