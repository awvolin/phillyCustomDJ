// ContentView.swift
// PhillyCustomDJ
//
// Created by Alex Volin on 8/17/23.

import SwiftUI

struct ContentView: View {
    @State private var selection: Int = 0
    
    var body: some View {
        Text("This")
            .font(Font.custom("TwCenMT-Regular", size: 120))
        //        TabView(selection: $selection) {
        //            CocktailView()
        //                .tabItem {
        //                    Image(systemName: "music.note")
        //                    Text("Mixes")
        //                }
        //                .tag(1)
        //            EventView()
        //                .tabItem {
        //                    Image(systemName: "person")
        //                    Text("My Event")
        //                }
        //        }
        
        
    }
}

func testFont() {
    for family: String in UIFont.familyNames {
        print("\(family)")
        for names: String in UIFont.fontNames(forFamilyName: family) {
            print("== \(names)")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
