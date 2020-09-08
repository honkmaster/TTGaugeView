//
//  TTGaugeView.swift
//
//  Created by Tobias Tiemerding on 28.07.20.
//

import SwiftUI

struct GaugeElement: View {
    var section: TTGaugeViewSection
    var startAngle: Double
    var trim: ClosedRange<CGFloat>
    var lineCap: CGLineCap = .butt
    
    var body: some View {
        GeometryReader { geometry in
            let lineWidth = geometry.size.width / 10
            
            section.color
                .mask(Circle()
                        .trim(from: trim.lowerBound, to: trim.upperBound)
                        .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: lineCap))
                        .rotationEffect(Angle(degrees: startAngle))
                        .padding(lineWidth/2)
                )
        }
    }
}

struct NeedleView: View {
    var angle: Double
    var value: Double = 0.0
    
    var body: some View {
        // 90 to start in south orientation, then add offset to keep gauge symetric
        let startAngle = 90 + (360.0-angle) / 2.0
        let needleAngle = startAngle + value * angle
        
        GeometryReader { geometry in
            ZStack
            {
                let rectWidth = geometry.size.width / 2
                let rectHeight = geometry.size.width / 20
                
                Rectangle()
                    .fill(Color.black.opacity(0.8))
                    .cornerRadius(rectWidth / 2)
                    .frame(width: rectWidth, height: rectHeight)
                    .offset(x: rectWidth / 2)
                
                Circle()
                    .frame(width: geometry.size.width / 10)
            }
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        }
        .rotationEffect(Angle(degrees: needleAngle))
    }
}


public struct TTGaugeView: View {
    var angle: Double
    var sections: [TTGaugeViewSection]
    var value: Double
    var valueDescription: String?
    var gaugeDescription: String?
    
    public init(angle: Double, sections: [TTGaugeViewSection], value: Double, valueDescription: String? = nil, gaugeDescription: String? = nil) {
        self.angle = angle
        self.sections = sections
        self.value = value
        self.valueDescription = valueDescription
        self.gaugeDescription = gaugeDescription
    }
    
    public var body: some View {
        // 90 to start in south orientation, then add offset to keep gauge symetric
        let startAngle = 90 + (360.0-angle) / 2.0
        
        ZStack {
            ForEach(sections) { section in
                // Find index of current section to sum up already covered areas in percent
                if let index = sections.firstIndex(where: {$0.id == section.id}) {
                    let alreadyCovered = sections[0..<index].reduce(0) { $0 + $1.size}
                    
                    // 0.001 is a small offset to fill a gap
                    let sectionSize = section.size * (angle / 360.0)// + 0.001
                    let sectionStartAngle = startAngle + alreadyCovered * angle
                    
                    GaugeElement(section: section, startAngle: sectionStartAngle, trim:  0...CGFloat(sectionSize))
                    
                    // Add round caps at start and end
                    if index == 0 || index == sections.count - 1{
                        let capSize: CGFloat = 0.001
                        let startAngle: Double = index == 0 ? sectionStartAngle : startAngle + angle
                        
                        GaugeElement(section: section,
                                     startAngle: startAngle,
                                     trim: 0...capSize,
                                     lineCap: .round)
                    }
                }
            }
            .overlay(
                VStack{
                    if let valueDescription = valueDescription {
                        Text(valueDescription)
                            .font(.title)
                    }
                    if let gaugeDescription = gaugeDescription {
                        Text(gaugeDescription)
                            .font(.caption)
                    }
                }, alignment: .bottom)
            
            NeedleView(angle: angle, value: value)
        }
    }
}
