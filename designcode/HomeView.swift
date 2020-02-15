//
//  HomeView.swift
//  designcode
//
//  Created by jesper kristiansen on 2/2/20.
//  Copyright © 2020 jesper kristiansen. All rights reserved.
//

import SwiftUI

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData = [
    Section(
        title: "Prototype designs in SwiftUI",
        text: "18 Sections", logo: "Logo1", image: Image("Card1"), color: Color("card1")),
    Section(
        title: "Prototype designs in SwiftUI",
        text: "18 Sections", logo: "Logo2", image: Image("Card2"), color: Color("card2")),
Section(
    title: "Prototype designs in SwiftUI",
    text: "18 Sections", logo: "Logo3", image: Image("Card3"), color: Color("card3")),
Section(
    title: "Prototype designs in SwiftUI",
    text: "18 Sections", logo: "Logo4", image: Image("Card4"), color: Color("card4")),
]

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate = false
    @Binding var showContent: Bool
    
    var body: some View {
        ScrollView (showsIndicators: false) {
            VStack {
                HStack {
                    Text("Watching")
    //                    .font(.system(size: 28, weight: .bold))
                        .modifier(CustomFontModifier(size: 30))
                    
                    Spacer()
                    AvatarView(showProfile: $showProfile)
                    Button(action: { self.showUpdate.toggle() }) {
                        Image(systemName: "bell")
                            .renderingMode(.original)
                            .font(.system(size: 16, weight: .medium))
                            .frame(width: 36, height: 36)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 1, y: 4)
                    }
                    .sheet(isPresented: $showUpdate) {
                        UpdateList()
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                ScrollView (.horizontal, showsIndicators: false) {
                    WatchRingsView()
                        .padding(.horizontal, 30)
                        .padding(.bottom, 20)
                        .onTapGesture {
                            self.showContent = true
                    }
                }
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 20) {
                        ForEach(sectionData) { item in
                            GeometryReader { geometry in
                                SectionView(section: item)
                                .rotation3DEffect(Angle(degrees:
                                    Double(geometry.frame(in: .global).minX - 30) / -18
                                ), axis: (x: 0.0, y: 10.0, z: 0.0))
                            }
                        .frame(width: 275, height: 275)
                        }
                    }
                    .padding(30)
                    .padding(.bottom, 30)
                }
                .offset(y: -30)
                
                HStack {
                    Text("Courses")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .padding(.leading, 30)
                .offset(y: -50)

                SectionView(section: sectionData[1], width: 300, height: 300)
                .offset(y: -50)

                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            showProfile: .constant(false),
            showContent:  .constant(false)
        )
    }
}

struct AvatarView: View {
    @Binding var showProfile: Bool
    var body: some View {
        Button(action: { self.showProfile.toggle() }) {
            
            Image("Avatar")
                .renderingMode(.original)
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
        }
    }
}

struct SectionView: View {
    var section: Section
    var width: CGFloat = 250
    var height: CGFloat = 250
    
    var body: some View {
        VStack {
            HStack (alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
            }
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
        }
        .frame(width: width, height: height)
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.4), radius: 20, x: 0, y: 20)
    }
}

struct WatchRingsView: View {
    var body: some View {
        HStack {
            HStack (spacing: 12) {
                RingView(color1: Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)), color2: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), width: 44, height: 44, percentage: 67, show: .constant(true))
                VStack (alignment: .leading, spacing: 4) {
                    Text("6 minutes left").bold().modifier(FontModifier(style: .subheadline))
                    Text("Watched 10 mins today").modifier(FontModifier(style: .caption))
                }
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            RingView(color1: Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)), color2: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), width: 28, height: 28, percentage: 13, show: .constant(true))
                .padding(8)
                .background(Color.white)
                .cornerRadius(20)
                .modifier(ShadowModifier())
            RingView(color1: Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)), color2: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), width: 28, height: 28, percentage: 37, show: .constant(true))
                .padding(8)
                .background(Color.white)
                .cornerRadius(20)
                .modifier(ShadowModifier())
            RingView(color1: Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)), color2: Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), width: 28, height: 28, percentage: 47, show: .constant(true))
                .padding(8)
                .background(Color.white)
                .cornerRadius(20)
                .modifier(ShadowModifier())
            
        }
    }
}
