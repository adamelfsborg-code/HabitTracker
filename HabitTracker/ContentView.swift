//
//  ContentView.swift
//  HabitTracker
//
//  Created by Adam Elfsborg on 2024-07-25.
//

import SwiftUI

@Observable
class Activities {
    var items = [ActivityItem]()
    
    
    init() {
        items = []
    }
    
}

struct ContentView: View {
    @State private var activites = Activities()
    @State private var path = [Int]()
    
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
                    path = [32]
                }
            }
            .navigationTitle("HabitTracker")
            .navigationDestination(for: Int.self) { _ in
                ActivityFormView(activites: activites)
            }
            .navigationDestination(for: ActivityItem.self) { _ in
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
