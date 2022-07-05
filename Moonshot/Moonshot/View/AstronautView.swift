//
//  AstronautView.swift
//  Moonshot
//
//  Created by Félix Tineo Ortega on 4/7/22.
//

import SwiftUI

struct AstronautView: View {
    var astronaut: Astronaut
    var body: some View {
        ScrollView {
            VStack{
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .padding(.bottom, 20)
                Text(astronaut.description)
                    .foregroundColor(.white)
            }
            .padding()

        }.navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(.DarkBlue)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static var previews: some View {
        let missions:[Mission] = Bundle.main.decode("missions.json")
        let astronauts:[String:Astronaut] = Bundle.main.decode("astronauts.json")
        let mission = missions[0]
        let memberName = mission.crew[0].name
        AstronautView(astronaut: astronauts[memberName]!)
    }
}
