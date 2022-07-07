//
//  EventsSectionView.swift
//  Starbucks
//
//  Created by kid cherish on 2022/07/06.
//

import SwiftUI

struct EventsSectionView: View {
    @Binding var events: [Event]
    
    var body: some View {
        VStack {
            HStack {
                Text("Events")
                    .font(.headline)
                
                Spacer()
                
                Button("See all") {}
                    .foregroundColor(.green)
                    .font(.subheadline)
            }
            .padding(.horizontal, 16.0)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16.0) {
                    ForEach(events) { event in
                        EventsSectionItemView(event: event)
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 150, maxHeight: .infinity)
                .padding(.horizontal, 16.0)
            }
        }
    }
}

struct EventsSectionItemView: View {
    let event: Event
    
    var body: some View {
        VStack {
            event.image
                .resizable()
                .scaledToFill()
                .frame(height: 150.0)
                .clipped()
            Text(event.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.headline)
            Text(event.description)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .font(.callout)
        }
        .frame(width: UIScreen.main.bounds.width - 32.0)
    }
}
