//
//  RewardsView.swift
//  Dopaminify
//
//  Created by Ayush on 7/1/23.
//

import SwiftUI

struct RewardsView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel

    let pointHistory: [(String, Int)] = [
        ("Screen Time Goal Achieved", 50),
        ("Screen Time Goal Failed", -30),
        ("Screen Time Goal Achieved", 50),
        ("User Joined!", 10)
    ] // Hardcoded point history

    
    var userPoints: Int {
        pointHistory.reduce(0) { $0 + $1.1 }
    } // Calculating user's points based on the point history
    
    var body: some View {
        VStack {
            
            // Display user's fullName at the top
            Text(viewModel.currentUser?.fullName ?? "User")
                .font(.subheadline)
                .foregroundColor(Color.secondary)
            
            // Display user's points at the top
            Text("Points: \(userPoints)")
                .font(.title)
                .fontWeight(.semibold)
                .padding()
            
                // Display point history
                List(pointHistory, id: \.0) { (title, points) in
                    HStack {
                        Text(title)
                        Spacer()
                        Text("\(points > 0 ? "+\(points)" : "\(points)")")
                            .foregroundColor(points > 0 ? .green : .red)
                    }
                    .padding(.vertical, 8)
                }
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("Rewards")
        }
    }

struct RewardsView_Previews: PreviewProvider {
    static var previews: some View {
        RewardsView()
    }
}
