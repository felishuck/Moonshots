//
//  Mission.swift
//  Moonshot
//
//  Created by Félix Tineo Ortega on 1/7/22.
//

import Foundation

struct Mission: Codable, Identifiable {
    let id: Int
    let crew: [CrewRole]
    let launchDate: Date?
    let description: String
    
    var missionName: String{
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String{
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
}
