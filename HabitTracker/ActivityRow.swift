//
//  ActivityRow.swift
//  HabitTracker
//
//  Created by Barış Can Sertkaya on 1.11.2023.
//

import SwiftUI

struct ActivityRow: View {
    
    let activity: Activity
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "dumbbell")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .foregroundColor(.accentColor)
                        .frame(width: 40,height: 40)
                )
            
            VStack {
                Text(activity.title)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            Text("\(activity.count)")
                .foregroundColor(.accentColor)
                .font(.system(size: 35))
                .fontWeight(.heavy)
        }
        .frame(height: 50)
        .padding(.horizontal)
    }
}

struct ActivityRow_Previews: PreviewProvider {
    
    static var previews: some View {
        List {
            ActivityRow(activity: Activity(title: "Gym", description: "You should hit the gym for your health", count: 5))
        }
    }
}
