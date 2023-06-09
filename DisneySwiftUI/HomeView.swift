//
//  HomeView.swift
//  DisneySwiftUI
//
//  Created by Anna Nosyk on 08/05/2023.
//

import SwiftUI

struct HomeView: View {
    @State var showProfile = false
    @State var viewState = CGSize.zero
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            HomePage(showProfile: $showProfile)
            .padding(.top, 44)
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: showProfile ? -450 : 0)
            .rotation3DEffect(Angle(degrees: Double(showProfile ? (viewState.height/10) - 10 : 0)), axis: (x: 10, y: 0, z: 0))
            .scaleEffect(showProfile ? 0.9 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            .edgesIgnoringSafeArea(.all)
            MenuView()
                .background(Color.black.opacity(0.001))
                .offset(y: showProfile ?  0 : screen.height)
                .offset(y: viewState.height)
                .animation(.spring(response: 0.7, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showProfile.toggle()
                }
                .gesture(DragGesture()
                    .onChanged({ value in
                        self.viewState = value.translation
                        if self.viewState.height > 50 {
                            self.showProfile = false
                        }
                    })
                        .onEnded({ value in
                            self.viewState = .zero
                        })
                )
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct AvatarView: View {
    @Binding var showProfile:Bool
    var body: some View {
        Button {
            self.showProfile.toggle()
        } label: {
            Image("human4")
                .renderingMode(.original)
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
        }
    }
}

let screen = UIScreen.main.bounds
