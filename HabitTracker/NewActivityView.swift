//
//  NewActivityView.swift
//  HabitTracker
//
//  Created by Barış Can Sertkaya on 1.11.2023.
//

import SwiftUI

struct NewActivityView: View {
    
    @ObservedObject var activities: Activities
    
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var count: Int = 0
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    VStack(spacing: 20) {
                        TextField("Title", text: $title)
                        TextField("Description", text: $description)
                        TextField("Count", value: $count, format: .number)
                    }
                    
                }
                .navigationTitle("Add new activity")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Add") {
                            let newActivity = Activity(title: title, description: description, count: count)
                            activities.activityArray.append(newActivity)
                            dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            title = ""
                            description = ""
                            count = 0
                            dismiss()
                        }
                    }
                }
            }
        }
    }
    
    struct NewActivityView_Previews: PreviewProvider {
        static var previews: some View {
            NewActivityView(activities: Activities())
        }
    }
}
