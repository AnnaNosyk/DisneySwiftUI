//
//  Home.swift
//  DisneySwiftUI
//
//  Created by Anna Nosyk on 09/05/2023.
//

import SwiftUI

struct Home: View {
    @Binding var showProfile: Bool
    var body: some View {
        VStack {
            HStack {
                AvatarView(showProfile: $showProfile)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 30)
            Spacer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(showProfile: .constant(false))
    }
}
