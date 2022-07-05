//
//  MissionGrid.swift
//  Moonshot
//
//  Created by Félix Tineo Ortega on 5/7/22.
//

import SwiftUI

struct MissionGrid: View {
    var missions:[Mission]
    var astronauts:[String: Astronaut]
    var body: some View {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]){
                ForEach(missions){ mission in
                    NavigationLink(destination: {
                        MissionView(mission: mission, astronauts: astronauts)
                    }, label: {
                        MissionGridLabel(mission: mission)
                            .padding(.bottom, 20)
                    })
                }
            }
    }
}

struct MissionGrid_Previews: PreviewProvider {
    
    static var missions:[Mission] = Bundle.main.decode("missions.json")
    static var astronauts:[String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionGrid(missions: missions, astronauts: astronauts)
    }
}
