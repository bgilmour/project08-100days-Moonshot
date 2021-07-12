//
//  MissionView.swift
//  Moonshot
//
//  Created by Bruce Gilmour on 2021-07-12.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    let astronauts: [CrewMember]

    init(mission: Mission, astronauts: [Astronaut]) {
        self.mission = mission

        var matches = [CrewMember]()

        for member in mission.crew {
            if let match = astronauts.first(where: { $0.id == member.name }) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }

        self.astronauts = matches
    }

    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: geo.size.width * 0.7)
                    .padding(.top)

                Text(mission.description)
                    .padding()

                ForEach(astronauts, id: \.role) { crewMember in
                    HStack {
                        Image(crewMember.astronaut.id)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 60)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                            .padding()

                        VStack(alignment: .leading) {
                            Text(crewMember.astronaut.name)
                                .font(.headline)
                            Text(crewMember.role)
                                .foregroundColor(.secondary)
                        }

                        Spacer()
                    }
                }

                Spacer(minLength: 25)
            }
        }
    }

    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
    }
}
