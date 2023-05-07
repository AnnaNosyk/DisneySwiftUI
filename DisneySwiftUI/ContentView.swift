//
//  ContentView.swift
//  DisneySwiftUI
//
//  Created by Anna Nosyk on 07/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius:show ? 20 : 0)
                .animation(.default)
            BackCardView(image: "nala")
             //   .background(Color("backGroungLionKing2"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x:0,y:show ? -400 : -40)
                .scaleEffect(0.9)
                .rotationEffect(.degrees(show ? 0: 10))
               .rotation3DEffect(.degrees(10), axis: (x: 10, y: 0, z: 0))
              .animation(.easeIn(duration: 0.5))
              
              
            BackCardView(image: "simba")
              //  .background(Color("backGroungLionKing1"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x:0,y:show ? -200 : -20)
                .scaleEffect(0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotation3DEffect(.degrees(5), axis: (x: 10, y: 0, z: 0))
                .animation(.easeIn(duration: 0.4))
             
            LionKingView()
                .onTapGesture {
                    self.show.toggle()
                }
            BottomCardView()
                .blur(radius:show ? 20 : 0)
                .animation(.default)
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
    @State var image: String
    var body: some View {
        VStack {
            Image(self.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)

           
            Spacer()
        }
        .frame(width: 340, height: 220)
        
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
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity)
        .background(Color("title"))
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(x:0, y: 500)
    }
}
