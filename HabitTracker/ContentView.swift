//
//  ContentView.swift
//  HabitTracker
//
//  Created by Adam Elfsborg on 2024-07-25.
//

import SwiftUI

@Observable
class Activities {
    
    var items = [ActivityItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Activities") {
            if let decodedItems = try? JSONDecoder().decode([ActivityItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
    
}

struct ContentView: View {
    @State private var activites = Activities()
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(activites.items) { activity in
                    NavigationLink(value: activity) {
                        ActivityItemView(item: activity)
                    }
                }.onDelete(perform:deleteActicityItems )
            }
            .toolbar {
                Button("New Activity", systemImage: "plus") {
                    path.append(32)
                }
            }
            .navigationTitle("HabitTracker")
            .navigationDestination(for: Int.self) { _ in
                ActivityFormView(activites: activites)
            }
            .navigationDestination(for: ActivityItem.self) { selection in
                ActivityDetailView(activity: selection, activities: activites)
            }
        }
    }
    
    func deleteActicityItems(at offset: IndexSet) {
        activites.items.remove(atOffsets: offset)
    }
    
    
}

#Preview {
    ContentView()
}
