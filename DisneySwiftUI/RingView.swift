//
//  RingView.swift
//  DisneySwiftUI
//
//  Created by Anna Nosyk on 07/05/2023.
//

import SwiftUI

struct RingView: View {
    var color1 = Color("backgroundLionKing")
    var color2 = Color("backGroungLionKing2")
    var widthHeight:CGFloat = 44
    var percent:CGFloat = 78
    @Binding var show: Bool
    var body: some View {
        let multiplier = widthHeight/44
        let progress = 1 - (percent/100)
       return  ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: widthHeight, height: widthHeight)
              
            Circle()
               .trim(from:show ? progress : 1, to: 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [color1,color2]), startPoint: .topTrailing, endPoint: .bottomLeading),  style: StrokeStyle(lineWidth: 5 * multiplier, lineJoin: .round))
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: widthHeight, height: widthHeight)
            .shadow(color: color1.opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
          
            Text("\(Int(percent))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true))
    }
}
