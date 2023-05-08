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
                .animation(.default)
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
            
            BottomCardView(show: $showCard)
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
                Text("My Lion King collection")
                    .foregroundColor(Color("title"))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("logoLion")
              .resizable()
              .aspectRatio(contentMode: .fit)
            Spacer()
        }  .background(Color("backgroundLionKing"))
    }
}

struct BottomCardView: View {
    @Binding var show: Bool
    var color1 = Color("backgroundLionKing")
    var color2 = Color("backGroungLionKing2")
    var body: some View {
        VStack(spacing: 8) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            Text("Open and collect all The Lion King pictures")
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .font(.headline)
                .foregroundColor(.black)
            HStack(spacing: 20) {
                RingView(color1: color1, color2: color2, widthHeight: 88, percent: 78, show: $show)
                VStack(alignment: .leading, spacing: 8) {
                    Text("Your personal collection of Lion King pictures")
                        .foregroundColor(Color("backgroundLionKing"))
                        .bold()
                        .font(.callout)
                    Text("78 out of 100 pictures are already opened.")
                        .font(.footnote)
                        .foregroundColor(Color("titleLionKing"))
                    
                }
                .padding(20)
                .background(Color("title"))
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 10)
                
                
            }
              Image("simba&nala")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Image("logoLion")
              .resizable()
              .aspectRatio(contentMode: .fit)
             
                
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
