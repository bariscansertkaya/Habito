//
//  Activity.swift
//  HabitTracker
//
//  Created by Barış Can Sertkaya on 1.11.2023.
//

import Foundation

struct Activity: Identifiable, Codable, Equatable {
    var id = UUID()
    let title: String
    let description: String
    var count: Int
}
