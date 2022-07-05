//
//  MissionList.swift
//  Moonshot
//
//  Created by Félix Tineo Ortega on 5/7/22.
//

import SwiftUI

struct MissionList: View {
    var missions:[Mission]
    var astronauts:[String: Astronaut]
    var body: some View {
        VStack{
            ForEach(missions, id: \.missionName){ mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    MissionRowLabel(mission: mission)
                        .padding()
                }
            }
        }
    }
}

struct MissionList_Previews: PreviewProvider {
    static var missions:[Mission] = Bundle.main.decode("missions.json")
    static var astronauts:[String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionList(missions: missions, astronauts: astronauts)
    }
}
