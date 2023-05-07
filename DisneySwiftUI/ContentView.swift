//
//  ContentView.swift
//  DisneySwiftUI
//
//  Created by Anna Nosyk on 07/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var stateView = CGSize.zero
    @State var showCard = false
    @State var botomState = CGSize.zero
    @State var showFull = false
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius:show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                .animation(.default
                    .delay(0.1))
            BackCardView(image: "nala")
                .frame(width: 340, height: 220)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x:0,y:show ? -400 : -40)
                .offset(x:stateView.width, y:stateView.height)
                .offset(y: showCard ? -180 : 0)
                .scaleEffect(showCard ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0: 10))
                .rotationEffect(.degrees(showCard ? -10: 0))
                .rotation3DEffect(.degrees(showCard ? 0 : 10), axis: (x: 10, y: 0, z: 0))
              .animation(.easeIn(duration: 0.5))
              
            BackCardView(image: "simba")
                .frame(width: 340, height: 220)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x:0,y:show ? -200 : -20)
                .offset(x:stateView.width, y:stateView.height)
                .offset(y: showCard ? -140 : 0)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotationEffect(.degrees(showCard ? -5: 0))
                .rotation3DEffect(.degrees(showCard ? 0 : 5), axis: (x: 10, y: 0, z: 0))
                .animation(.easeIn(duration: 0.4))
            LionKingView()
                .frame(width:showCard ? 375 : 340,height: 220)
                .background(Color("fontLionKing"))
               // .cornerRadius(20)
                .clipShape(RoundedRectangle(cornerRadius:showCard ? 30: 20,style: .continuous))
                .shadow(radius: 20)
                .offset(x:stateView.width, y:stateView.height)
                .offset(y: showCard ? -100 : 0)
                .animation(.spring(response: 0.3,dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showCard.toggle() //showCard
                }
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                        self.stateView = value.translation
                        self.show = true
                    })
                        .onEnded({ value in
                            self.stateView = .zero
                            self.show = false
                        })
                )
            BottomCardView()
                .offset(x:0, y: showCard ? 360 : 1000)
                .offset(y:botomState.height)
                .blur(radius:show ? 20 : 0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            self.botomState = value.translation
                            if self.showFull {
                                self.botomState.height += -300
                            }
                            if self.botomState.height < -300 {
                                self.botomState.height = -300
                            }
                        })
                        .onEnded({ value in
                            if self.botomState.height > 50 {
                                self.showCard = false
                            }
                            if (self.botomState.height < -100 && !self.showFull) || (self.botomState.height < 250 && self.showFull) {
                                self.botomState.height = -300
                                self.showFull = true
                            } else {
                                self.botomState = .zero
                                self.showFull = false
                            }
                            
                        })
                )
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
    }
}

struct BackCardView: View {
    @State var image: String
    var body: some View {
        VStack {
            Image(self.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            Spacer()
        }
        
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Lion King")
                    .foregroundColor(Color("title"))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Spacer()
        }  .background(Color("backgroundLionKing"))
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 24) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            Text("Choose your favourite  Lion King cards")
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .font(.headline)
                .foregroundColor(Color("backgroundLionKing"))
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity)
        .background(Color("bottomLionKingView"))
        .cornerRadius(30)
        .shadow(radius: 20)
        
    }
}
