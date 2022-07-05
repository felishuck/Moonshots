//
//  Separator.swift
//  Moonshot
//
//  Created by Félix Tineo Ortega on 5/7/22.
//

import SwiftUI

struct Separator: View {
    var color: Color
    var height: CGFloat
    var body: some View {
        Rectangle()
            .frame(height: height)
            .foregroundColor(color)
    }
}

struct Separator_Previews: PreviewProvider {
    static var previews: some View {
        Separator(color: .black, height: 2)
    }
}
