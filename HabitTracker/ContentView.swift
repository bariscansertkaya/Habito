//
//  ContentView.swift
//  HabitTracker
//
//  Created by Barış Can Sertkaya on 1.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var activities = Activities()
    @State private var showingNewActivityView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(activities.activityArray) { activity in
                        NavigationLink {
                            DetailView(activities: activities, activity: activity)
                        } label: {
                            ActivityRow(activity: activity)
                        }
                    }
                    .onDelete(perform: removeRows)
                }
            }
            .navigationTitle("Habito")
            .fullScreenCover(isPresented: $showingNewActivityView) {
                NewActivityView(activities: activities)
            }
            .toolbar {
                Button {
                    showingNewActivityView = true
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 20, weight: .bold, design: .default))
                }
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        activities.activityArray.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
