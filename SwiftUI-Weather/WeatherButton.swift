//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Edney Mesquita on 26/07/21.
//

import Foundation
import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .foregroundColor(textColor)
            .cornerRadius(10)
    }
}
