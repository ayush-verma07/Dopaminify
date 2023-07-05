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
            
            ScrollView {
                VStack {
                    Section(header: Text("Weekly Challenges")) {
                        LazyHGrid(rows: [GridItem(.flexible())], spacing: 16) {
                            ChallengeTile(title: "Excercise", points: 20, imageName: ("heart.fill"), imageColor: Color(.systemGreen))
                                .frame(width: 125)
                            ChallengeTile(title: "Family", points: 30, imageName: ("person.3.fill"),imageColor: Color(.systemOrange))
                                .frame(width: 125)
                            ChallengeTile(title: "Study", points: 40, imageName: ("book.fill"), imageColor: Color(.systemBlue))
                                .frame(width: 125)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                    
                }
            }
            .navigationTitle("Rewards")
            
            HStack {
                Text("Challenges in")
                    .font(.caption)
                Text("italics")
                    .font(.italic(.caption)())
                Text("have not been completed.")
                    .font(.caption)
            }
        }
    }
}
    struct ChallengeTile: View {
        let title: String
        let points: Int
        let imageName: String
        let imageColor: Color
        
        var body: some View {
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundColor(imageColor)
                Text(title)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.bottom, 4)
                Text("Points: \(points)")
                    .font(.italic(.caption2)())
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
        }
    }
    
    
    
    struct RewardsView_Previews: PreviewProvider {
        static var previews: some View {
            RewardsView()
        }
    }

