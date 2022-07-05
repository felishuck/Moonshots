//
//  MissionRowLabel.swift
//  Moonshot
//
//  Created by Félix Tineo Ortega on 2/7/22.
//

import SwiftUI

struct MissionGridLabel: View {
    var mission: Mission
    var body: some View {
        VStack(spacing: 0) {
            Image(mission.missionName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding()
                .background(.white)
            VStack{
                Text(mission.missionName.capitalized)
                    .font(.title2.bold())
                    .foregroundColor(.white)
                Text(mission.formattedLaunchDate.uppercased())
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.8))
            }.frame(width: 100)
                .padding()
                .background(.DarkBlue)
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: .black, radius: 5, x: 0, y: 0)
        .overlay(RoundedRectangle(cornerRadius: 15)
            .stroke()
            .foregroundColor(.secondary)
        )
    }
}

struct MissionGridLabel_Previews: PreviewProvider {
    
    static let missions:[Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        MissionRowLabel(mission: missions[0])
    }
}
