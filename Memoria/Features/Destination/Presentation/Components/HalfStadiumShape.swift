//
//  HalfStadiumShape.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 04/05/23.
//

import SwiftUI


struct HalfStadiumShape: View {
    var body: some View {
        
        VStack {
            HalfStadium()
                .frame(width: 100, height: 200)
                            .foregroundColor(.red)
                            .shadow(color: .pink, radius: 10)
                            .frame(width: 300, height: 300)
            Rectangle()
        }
    }
}

struct HalfStadiumShape_Previews: PreviewProvider {
    static var previews: some View {
        HalfStadiumShape()
    }
}


struct HalfStadium: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
       

        let radius = min(rect.midX, rect.midY)
        
        path.addArc(
          center: CGPoint(x: rect.midX, y: rect.minY),
          radius: rect.width / 2,
          startAngle: Angle(degrees: 0),
          endAngle: Angle(degrees: 180),
          clockwise: true)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.height))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        path.closeSubpath()
        
        

        

        
        return path
    }
    
    
}
