//
//  NotificationsView.swift
//  Dopaminify
//
//  Created by Ayush on 7/8/23.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        VStack {
            Image(systemName: "bell.fill")
                .font(.system(size: 64))
                .foregroundColor(Color(.systemOrange))
            
            Text("Notifications")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("Coming Soon!")
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.top, 8)
            
            Text("Stay tuned for updates on the exciting new notification feature.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                .foregroundColor(.secondary)
            

        }
        .padding()
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
