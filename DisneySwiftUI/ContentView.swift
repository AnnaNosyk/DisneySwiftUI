//
//  ContentView.swift
//  DisneySwiftUI
//
//  Created by Anna Nosyk on 07/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackCardView()
                .background(Color("backGroungLionKing2"))
                .cornerRadius(20)
                .offset(x:0,y: -40)
                .scaleEffect(0.9)
            BackCardView()
                .background(Color("backGroungLionKing1"))
                .cornerRadius(20)
                .offset(x:0,y: -20)
                .scaleEffect(0.95)
            LionKingView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LionKingView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("King Lion")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("textLionKingColor"))
                    Text("Disney")
                        .foregroundColor(Color("titleLionKing"))
                }
                Spacer()
                Image("appstore")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                    .cornerRadius(20)
            }
            .padding(.horizontal,20)
            .padding(.top, 20)
            Image("lionKing")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .frame(width: 300,height: 110,alignment: .top)
            
        }
        .frame(width: 340,height: 220)
        .background(Color("fontLionKing"))
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(width: 340, height: 220)
        
    }
}
