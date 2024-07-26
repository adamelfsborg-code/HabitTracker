//
//  Activity.swift
//  HabitTracker
//
//  Created by Adam Elfsborg on 2024-07-25.
//

import Foundation

struct ActivityItem: Codable, Identifiable, Hashable, Equatable {
    var id = UUID()
    let name: String
    let description: String
    var completionCount = 0
}
