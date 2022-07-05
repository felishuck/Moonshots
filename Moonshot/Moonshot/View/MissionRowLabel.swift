//
//  MissionRowLabel.swift
//  Moonshot
//
//  Created by Félix Tineo Ortega on 5/7/22.
//

import SwiftUI

struct MissionRowLabel: View {
    var mission: Mission
    var body: some View {
        HStack{
            Image(mission.missionName)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .padding()
            VStack{
                Text(mission.missionName.capitalized)
                    .font(.title.bold())
                Text(mission.formattedLaunchDate)
                    .opacity(0.6)
            }.foregroundColor(.white)
        }.frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .shadow(radius: 10, x: 0, y: 0)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke()
                    .foregroundColor(.white)
                    
            )
    }
}

struct MissionRowLabel_Previews: PreviewProvider {
    static let missions:[Mission] = Bundle.main.decode("missions.json")
    static var previews: some View {
        MissionRowLabel(mission: missions[0])
    }
}
