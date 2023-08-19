// ContentView.swift
// PhillyCustomDJ
//
// Created by Alex Volin on 8/17/23.

import SwiftUI

struct ContentView: View {
    var mixes: [Item] = [
        Item(title: "Out On A Limb Vol. 6", imageName: "img1"),
        Item(title: "Jill & Mike", imageName: "Jenny"),
        Item(title: "Morris Arboretum Cocktail Hour", imageName: "img2"),
        Item(title: "Jenny & Jeff", imageName: "Jeff"),
    ]
    
    @State private var selectedItem: Item? = nil
    
    
    var body: some View {
        VStack {
            Spacer()
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                .edgesIgnoringSafeArea(.all)
//            Text("Custom Mixes:")
//                .padding(.leading)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .font(Font.custom("TwCenMT-Regular", size: 40))

            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(mixes, id: \.title) { item in
                        HStack {
                            Image(item.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 75, height: 75)
                                .clipped()
                            Text(item.title)
                                .font(Font.custom("TwCenMT-Regular", size: 30))
                                .colorInvert()
                            Spacer()
                            
                            
                        }
                        .padding([.top, .leading, .trailing])
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                        .onTapGesture {
                            selectedItem = item
                        }
                    }
                }
                
            }
        }
        .background(Color(red: 75.0/255, green: 160.0/255, blue: 215.0/255))
        .sheet(item: $selectedItem) { item in
            // Your sample songs
            let songs = [
                Song(title: "Controlla", artist: "Drake"),
                Song(title: "Child's Play", artist: "Drake"),
                Song(title: "Same Ol' Mistakes", artist: "Rihanna"),
                Song(title: "Hard to Explain", artist: "The Strokes"),
                Song(title: "The Kids Don't Stand a Chance", artist: "Vampire Weekend"),
                Song(title: "Complicated", artist: "Mac Miller"),
                Song(title: "Every Step", artist: "D.O.D."),
                Song(title: "Jet Fuel", artist: "Mac Miller"),
                Song(title: "Controlla", artist: "Drake"),
                Song(title: "Child's Play", artist: "Drake"),
                Song(title: "Same Ol' Mistakes", artist: "Rihanna"),
                Song(title: "Hard to Explain", artist: "The Strokes"),
                Song(title: "The Kids Don't Stand a Chance", artist: "Vampire Weekend"),
                Song(title: "Complicated", artist: "Mac Miller"),
                Song(title: "Every Step", artist: "D.O.D."),
                Song(title: "Jet Fuel", artist: "Mac Miller"),
                // Add more songs here...
            ]

            // Pass the item and songs to the PlaylistView
            PlaylistView(item: item, songs: songs)
        }

        .font(Font.custom("TwCenMT-Regular", size: 30))
    }
}


struct PlaylistView: View {
    let item: Item
    let songs: [Song] // An array of songs in the playlist

    var body: some View {
        VStack {
            // HStack for the image and title
            HStack {
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipped()
                    .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                Text(item.title)
                    .font(Font.custom("TwCenMT-Regular", size: 32))
                    .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                Spacer()
            }
            
            .padding()

            HStack{
                Image("spotify")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                    .edgesIgnoringSafeArea(.all)
                Image("appleMusic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                    .edgesIgnoringSafeArea(.all)
            }
            // ScrollView for the numbered playlist
            ScrollView {
                VStack(alignment: .trailing) {
                    ForEach(songs.indices, id: \.self) { index in
                        HStack {
                            Text("\(index + 1).")
                                .font(Font.custom("TwCenMT-Regular", size: 24))
                                .frame(alignment: .leading) // Align the numbers to the leading edge

                            VStack(alignment: .leading) { // Align the song titles and artists to the leading edge
                                Text(songs[index].title)
                                    .font(Font.custom("TwCenMT-Regular", size: 24))
                                Text(songs[index].artist)
                                    .font(Font.custom("TwCenMT-Regular", size: 20))
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer() // Fill the remaining space to the right
                        }
                        .padding(.horizontal)

                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all) // Ignores safe areas to stretch the background color
    }
}



struct Song {
    let title: String
    let artist: String
}


struct Item: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

