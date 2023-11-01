//
//  DetailView.swift
//  HabitTracker
//
//  Created by Barış Can Sertkaya on 1.11.2023.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var activities: Activities
    @State private var activity: Activity
    
    init(activities: Activities, activity: Activity) {
        self.activities = activities
        self._activity = State(initialValue: activity)
    }
    
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 50) {
                Text(activity.description)
                
                Text("\(activity.count)")
                
                Button("Increment count") {
                    
                    if let index = activities.activityArray.firstIndex(of: activity) {
                        activities.activityArray[index].count += 1
                    }
                }
                .buttonStyle(.borderedProminent)
            }
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(activities: Activities(), activity: Activity(title: "Gym", description: "You should hit the gym for your health", count: 5))
    }
}
