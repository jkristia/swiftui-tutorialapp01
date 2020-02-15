//
//  MenuView.swift
//  designcode
//
//  Created by jesper kristiansen on 2/1/20.
//  Copyright © 2020 jesper kristiansen. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack (spacing: 16) {
                
                Progressbar()
                MenuRow(title: "Account", icon: "gear")
                MenuRow(title: "Billing", icon: "creditcard")
                MenuRow(title: "Sign Out", icon: "person.crop.circle")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
//            .background(Color.white)
            .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(radius: 30)
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 00, y: 20)
            .padding(.horizontal, 30)
            .overlay(
                VStack {
                    Image("Avatar")
                    .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                }
                .offset(y: -150)
            )
        }
        .padding(.bottom, 30)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuRow: View {
    let title: String
    let icon: String
    var body: some View {
        HStack (spacing: 10) {
//            Spacer()
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: 120, alignment: .leading)
//            Spacer()
        }
    }
}

struct Progressbar: View {
    var body: some View {
        VStack {
            Text("jkristia 19% complete")
                .font(.caption)
            Color.white // this is just another view
                .frame(width: 38, height: 6)
                .cornerRadius(3)
                .frame(width: 130, height: 6, alignment: .leading)
                .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.06))
                //                        .background(Color.green)
                .cornerRadius(3)
                .padding()
                .frame(width: 150, height: 20)
                .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.09))
                .cornerRadius(10)
        }
    }
}
