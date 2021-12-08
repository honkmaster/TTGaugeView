//
//  TTGaugeViewSettings.swift
//
//
//  Created by James Ford
//  Modified to allow further customization of Tobias Tiemerding's TTGaugeView
//

import Foundation
import SwiftUI

public struct TTGaugeViewSettings: Identifiable {
    public var id = UUID()
    var faceColor: Color?
    var needleColor: Color?
    
    public init(faceColor: Color? = nil, needleColor: Color? = nil) {
        self.faceColor = faceColor
        self.needleColor = needleColor

    }
}
