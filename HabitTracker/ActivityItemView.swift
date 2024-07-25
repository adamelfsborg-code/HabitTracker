//
//  ActivityItemView.swift
//  HabitTracker
//
//  Created by Adam Elfsborg on 2024-07-25.
//

import SwiftUI

struct ActivityItemView: View {
    let item: ActivityItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                    .foregroundStyle(.indigo)
                
                Text(item.description)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
        }
    }
    
    init(item: ActivityItem) {
        self.item = item
    }
}

#Preview {
    ActivityItemView(item: ActivityItem(name: "Test", description: "This is a test description"))
}
