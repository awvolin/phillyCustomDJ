// DetailedView.swift
// PhillyCustomDJ

import SwiftUI

struct CocktailView: View {
    var items: [Item] = [
        Item(title: "Out on a limb vol. 6", imageName: "img1"),
        Item(title: "Morris Arboretum Cocktail Hour", imageName: "img2"),
        // Add more items here...
    ]
    
    var body: some View {
        VStack {
            Spacer()
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(items, id: \.title) { item in
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
                        .padding(0)
                    }
                }
                
            }
            
            
            
        }
        .background(Color(red: 75.0/255, green: 160.0/255, blue: 215.0/255))
    }
}
struct Item {
    let title: String
    let imageName: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

