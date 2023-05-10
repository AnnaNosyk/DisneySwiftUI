//
//  Home.swift
//  DisneySwiftUI
//
//  Created by Anna Nosyk on 09/05/2023.
//

import SwiftUI

struct HomePage: View {
    @Binding var showProfile: Bool
    var body: some View {
        VStack {
            HStack {
                AvatarView(showProfile: $showProfile)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x: 0, y: 10, z: 0))
                        }
                        .frame(width: 275, height: 275)
                    }
                }
                .padding(30)
                .padding(.bottom, 30)
            }
            
            Spacer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(showProfile: .constant(false))
    }
}

struct SectionView: View {
    var section: Section
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text(section.title)
                    .font(.system(size: 19, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(Color("title"))
                Spacer()
                Image(section.logo)
                    .resizable()
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
                
            }
            Text(section.text)
                .frame(maxWidth: .infinity, alignment: .leading)
          section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
                .cornerRadius(20)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData = [Section(title: "Mermaid", text: "70 pctures".uppercased(), logo: "disneyLogo", image: Image("mermaid"), color: Color("mermaidBackground")),
                   Section(title: "Lion King", text: "100 pctures".uppercased(), logo: "disneyLogo", image: Image("lionKing"), color: Color("backgroundLionKing")),
                   Section(title: "Alice in wonderland", text: "60 pctures".uppercased(), logo: "disneyLogo", image: Image("alice"), color: Color("aliceBackground")),
                   Section(title: "Cinderella", text: "75 pctures".uppercased(), logo: "disneyLogo", image: Image("cinderella"), color: Color("cinderellaBackground")),
                   Section(title: "Sleeping beauty", text: "80 pctures".uppercased(), logo: "disneyLogo", image: Image("sleepingbeauty"), color: Color("sleepyBackground")),
                   Section(title: "Aladdin", text: "55 pctures".uppercased(), logo: "disneyLogo", image: Image("aladdin"), color: Color("aladdinBackground"))

]
