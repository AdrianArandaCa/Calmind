//
//  TimeComponents.swift
//  Calmind
//
//  Created by Adrian Aranda Campanario on 23/7/24.
//

import Foundation

extension DateComponentsFormatter {
    static let positional: DateComponentsFormatter = {
        print("Initializing time components Formatter.positional")
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        return formatter
    }()
}
