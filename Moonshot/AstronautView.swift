//
//  AstronautView.swift
//  Moonshot
//
//  Created by Bruce Gilmour on 2021-07-12.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions: [Mission]

    init(astronaut: Astronaut) {
        self.astronaut = astronaut

        let missions: [Mission] = Bundle.main.decode("missions.json")

        self.missions = missions.filter { mission in
            mission.crew.first(where: {$0.name == astronaut.id}) != nil
        }
    }

    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                VStack {
                    Image(astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)

                    Text(astronaut.description)
                        .padding()
                        .layoutPriority(1)

                    VStack(alignment: .leading) {
                        Section(header: Text("Mission list").fontWeight(.bold)) {
                            List(missions) { mission in
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 44, height: 44)

                                VStack(alignment: .leading) {
                                    Text(mission.displayName)
                                        .font(.headline)
                                    Text(mission.formattedLaunchDate)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        AstronautView(astronaut: astronauts[7])
    }
}
