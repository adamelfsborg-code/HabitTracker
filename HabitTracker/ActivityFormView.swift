//
//  ActivityFormView.swift
//  HabitTracker
//
//  Created by Adam Elfsborg on 2024-07-25.
//

import SwiftUI

struct ActivityFormView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var description = ""
    var activites: Activities
    
    var body: some View {
        Form {
            Section("Name") {
                TextField("Name", text: $name)
            }
            Section("Description") {
                TextField("Description", text: $description)
            }
        }
        .navigationTitle("Add Activity")
        .toolbar {
            Button("Save") {
                let activity = ActivityItem(name: name, description: description)
                activites.items.insert(activity, at: 0)
                dismiss()
            }
        }
    }
}

#Preview {
    ActivityFormView(activites: Activities())
}
