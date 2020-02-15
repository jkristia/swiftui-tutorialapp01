//
//  Home.swift
//  designcode
//
//  Created by jesper kristiansen on 2/2/20.
//  Copyright © 2020 jesper kristiansen. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var showProfile = false
    @State var viewState = CGSize.zero
    @State var showContent = false;
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 0.08998753834))
                .edgesIgnoringSafeArea(.all)
            HomeTitle(showProfile: $showProfile, viewState: $viewState, showContent: $showContent)
            MenuView()
                .background(Color.black.opacity(0.001)) // must have some opacity set else tapGesture will not work
                .offset(y: showProfile ? 0 : screen.height)
                .offset(y: viewState.height)
                .animation(.easeInOut(duration: 0.2))
                .onTapGesture {
                    self.showProfile.toggle()
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.viewState = value.translation
                    }
                    .onEnded { value in
                        if self.viewState.height > 50 {
                            self.showProfile = false
                        }
                        self.viewState = .zero
                    }
            )
            if showContent {
                Color.green.edgesIgnoringSafeArea(.all)
                ContentView()
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "xmark")
                            .frame(width:36, height:36)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .padding()
                            .onTapGesture {
                                self.showContent = false;
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct HomeTitle: View {
    @Binding var showProfile: Bool
    @Binding var viewState: CGSize
    @Binding var showContent: Bool
    var body: some View {
        HomeView(showProfile: $showProfile, showContent: $showContent)
        .padding(.top, showProfile ? 0 : 44)
        .background(
            VStack {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color.white]),
                                                  startPoint: .top, endPoint: .bottom)
                    .frame(height: 200)
                Spacer()
            }
         )
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
        .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
        .scaleEffect(showProfile ? 0.9 : 1)
        .rotation3DEffect(Angle(degrees: showProfile ? Double(-viewState.height / 5) + 10 : 0), axis: (x:10, y: 0, z:0))
        .animation(.easeInOut(duration: 0.2))
        .edgesIgnoringSafeArea(.all)
    }
}
