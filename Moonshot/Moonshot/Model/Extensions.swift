//
//  Extensions.swift
//  Moonshot
//
//  Created by Félix Tineo Ortega on 1/7/22.
//

import Foundation
import SwiftUI


extension Bundle{
    func decode<T: Codable>(_ fileName: String)-> T{
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            fatalError("Error. File not found")
        }
        
        guard let fileContent = try? String(contentsOf: fileURL) else {
            fatalError("Error. Impossible to read the file")
        }
        
        guard let dataContent = fileContent.data(using: .utf16) else {
            fatalError("Error. Imposible to convert String to data")}
        
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US")
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        guard let decodedData = try? decoder.decode(T.self, from: dataContent) else {
            fatalError("Error. Impossible to decode data into the given type")
        }
        
        return decodedData
    }
}

extension ShapeStyle where Self == Color {
    static var DarkBlue: Color {
        Color(.sRGB, red: 21/255, green: 34/255, blue: 56/255, opacity: 1)
    }
}
