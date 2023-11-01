//
//  Activities.swift
//  HabitTracker
//
//  Created by Barış Can Sertkaya on 1.11.2023.
//

import Foundation

class Activities: ObservableObject {
    
    @Published var activityArray = [Activity]() {
        
        didSet {
            // Create an encoder
            let encoder = JSONEncoder()
            
            // Try to encode items array
            if let encoded = try? encoder.encode(activityArray) {
                
                // Save to UserDefaults if encoding is successful
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }

    init() {
        // Create an decoder
        let decoder = JSONDecoder()
        
        // Pull item data from UserDefaults as savedItems
        if let savedItems = UserDefaults.standard.data(forKey: "Activities") {
            
            // Decode data as ExpenseItem array
            if let encoded = try? decoder.decode([Activity].self, from: savedItems) {
                // Assign encoded array to items
                activityArray = encoded
                return
            }
        }
        
        activityArray = []
    }
}
