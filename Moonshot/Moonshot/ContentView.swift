//
//  ContentView.swift
//  Moonshot
//
//  Created by Félix Tineo Ortega on 30/6/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = MissionsViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView {
                if viewModel.showAsGrid {
                    MissionGrid(missions: viewModel.missions, astronauts: viewModel.astronauts)
                        .transition(.asymmetric(insertion: .scale, removal: .move(edge: .bottom)))
                } else {
                    MissionList(missions: viewModel.missions, astronauts: viewModel.astronauts)
                        .transition(.asymmetric(insertion: .scale, removal: .move(edge: .bottom)))
                }
            }.onAppear{
                viewModel.loadData()
            }
            .navigationTitle("NASA Missions")
            .preferredColorScheme(.dark)
            .background(.DarkBlue)
            .toolbar {
                Button {
                    withAnimation {
                        viewModel.showAsGrid.toggle()
                    }
                } label: {
                    if viewModel.showAsGrid {
                        Image(systemName: "list.bullet")
                    } else {
                        Image(systemName: "square.grid.2x2")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
