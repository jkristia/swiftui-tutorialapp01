//
//  RingView.swift
//  designcode
//
//  Created by jesper kristiansen on 2/4/20.
//  Copyright © 2020 jesper kristiansen. All rights reserved.
//

import SwiftUI

struct RingView: View {
    
    var color1 = Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
    var color2 = Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
    var width: CGFloat = 120
    var height: CGFloat = 120
    var percentage: CGFloat = 96
    
    @Binding var show: Bool
    
    var body: some View {
        let multiplier = width / 44
        let progress = 1 - (percentage / 100)
        return ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), lineWidth: 5 * multiplier)
                .frame(width: width, height: height)
            Circle()
                .trim(from: show ? progress : 1, to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .topLeading, endPoint: .bottomTrailing),
                    style: StrokeStyle(
                        lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round,
                        miterLimit: 0, dash: [1, 0], dashPhase: 0)
                )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: width, height: height)
                .shadow(color: Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)).opacity(0.2), radius: 3 * multiplier, x: 0, y: 3 * multiplier )
//                .animation(.easeInOut)
            
            Text("\(Int(percentage))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
                .onTapGesture {
                    self.show.toggle()
                }
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true))
    }
}
