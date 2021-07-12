//
//  MissionView.swift
//  Moonshot
//
//  Created by Bruce Gilmour on 2021-07-12.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission

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

                Spacer(minLength: 25)
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")

    static var previews: some View {
        MissionView(mission: missions[0])
    }
}
