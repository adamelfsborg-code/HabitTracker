//
//  ActivityDetailView.swift
//  HabitTracker
//
//  Created by Adam Elfsborg on 2024-07-26.
//

import SwiftUI

struct ActivityDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    var activity: ActivityItem
    var activities: Activities
    
    var body: some View {
        VStack {
            Text("Completed ^[\(activity.completionCount) times](inflect: true)")
            Text(activity.description)
                .font(.caption.bold())
            Button("Complete activity") {
                complete()
            }.buttonStyle(.borderedProminent)
        }
        .navigationTitle(activity.name)
    }
    
    
    func complete() {
        var newActivity = activity
        newActivity.completionCount += 1
        
        let index = activities.items.firstIndex(where: { $0.name == activity.name }) ?? -1
        if index == -1 {
            return
        }
        activities.items[index] = newActivity

        dismiss()
    }
    
  
}

#Preview {
    let activites = Activities()
    let activity = ActivityItem(name: "Test", description: "Test ")
    activites.items.append(activity)
    return ActivityDetailView(activity: activity, activities: activites)
}
