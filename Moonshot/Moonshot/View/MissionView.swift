//
//  MissionView.swift
//  Moonshot
//
//  Created by Félix Tineo Ortega on 4/7/22.
//

import SwiftUI

struct MissionView: View {
    var mission: Mission
    var astronauts: [CrewMember]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack(alignment: .center, spacing: 20){
                    Image(mission.missionName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                    Separator(color: .secondary, height: 2)
                    VStack(alignment: .leading, spacing: 20){
                        Text("Mission Hightlights")
                            .font(.title.bold())
                        Text("Lauch Date: \(mission.launchDate?.formatted(date: .long, time: .omitted) ?? "N/A")")
                        Text(mission.description)
                        Separator(color: .secondary, height: 2)
                        Text("Crew")
                            .font(.title.bold())
                        ScrollView(.horizontal){
                            HStack(spacing: 0){
                                ForEach(astronauts, id: \.member.name){ astronaut in
                                    NavigationLink {
                                        AstronautView(astronaut: astronaut.member)
                                    } label: {
                                        VStack {
                                            Image(astronaut.member.id)
                                                .resizable()
                                                .scaledToFill()
                                                .clipShape(Circle())
                                            .frame(height: 200)
                                            .overlay(
                                                Circle()
                                                    .strokeBorder()
                                            )
                                            VStack {
                                                Text(astronaut.member.name)
                                                    .bold()
                                                Text(astronaut.role)
                                                    .opacity(0.6)
                                            }.foregroundColor(.white)
                                            
                                        }
                                    }
                                }
                            }
                        }
                    }
                }.padding(.horizontal)
            }
        }.navigationTitle(mission.missionName.capitalized)
            .navigationBarTitleDisplayMode(.inline)
            .preferredColorScheme(.dark)
            .background(.DarkBlue)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]){
        self.mission = mission
        self.astronauts = mission.crew.map { member in
            if let astronaut = astronauts[member.name]{
                let member = CrewMember(role: member.role, member: astronaut)
                print(member)
                return member
            } else {
                fatalError("The astronaut could not be loaded")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static var missions: [Mission] = Bundle.main.decode("missions.json")
    static var astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
    }
}
