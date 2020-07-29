//
//  File.swift
//  
//  Created by Tobias Tiemerding on 29.07.20.
//

import SwiftUI

public struct TTGaugeViewSection: Identifiable {
    public var id = UUID()
    var color: Color
    var size: Double
    
    public init(color: Color, size: Double) {
        self.color = color
        self.size = size
    }
}
