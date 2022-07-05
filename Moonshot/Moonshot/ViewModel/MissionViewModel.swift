//
//  MissionViewModel.swift
//  Moonshot
//
//  Created by Félix Tineo Ortega on 5/7/22.
//

import Foundation

class MissionsViewModel: ObservableObject {
    @Published var missions:[Mission] = []
    @Published var astronauts: [String: Astronaut] = [:]
    @Published var showAsGrid = true
    
    func loadData(){
        missions = loadMissions()
        astronauts = loadAstronauts()
    }
    
    func loadMissions()->[Mission]{
        Bundle().decode("missions.json")
    }
    
    func loadAstronauts()->[String: Astronaut]{
        Bundle().decode("astronauts.json")
    }
    
}

