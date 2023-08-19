// DetailedView.swift
// PhillyCustomDJ

import SwiftUI

struct CocktailView: View {
    var items: [Item] = [
        Item(title: "Item 1", imageName: "star"),
        Item(title: "Item 2", imageName: "star"),
        // Add more items here...
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                ForEach(items, id: \.title) { item in
                    HStack {
                        Text(item.title)
                            .font(.headline)
                        
                        Spacer()
                        
                        Image(systemName: item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                            .clipped()
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                    .padding(0)
                }
            }
        }
    }
}

struct Item {
    let title: String
    let imageName: String
}


