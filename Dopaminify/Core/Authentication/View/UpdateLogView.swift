//
//  UpdateLogView.swift
//  Dopaminify
//
//  Created by Ayush on 7/6/23.
//


import SwiftUI

struct UpdateLogView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Update Log")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 16)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                UpdateLogSection(number: "1.0.0", title: "Public Release", date: "6 July 2023", description: "Public release! This update brings a fully functional and polished version of Dopaminify, empowering users to effortlessly track and manage their screen time goals. Experience a seamless user interface, enhanced performance, and exciting new features to support your digital well-being journey.")
                
                Spacer(minLength: 400)
                
                Text("If you have any questions or concerns regarding this Update Log, please contact us through the Support section on your profile.")
                    .font(.caption)
                    .fontWeight(.bold)
            }
            .padding()
        }
        .navigationTitle("Update Log")
    }
}

struct UpdateLogSection: View {
    let number: String
    let title: String
    let date: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(number)
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding(.trailing, 8)
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                Text(date)
                    .font(.subheadline)
                    .fontWeight(.light)
            }
            
            Text(description)
                .font(.body)
                .foregroundColor(.primary)
        }
    }
}

struct UpdateLogView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateLogView()
    }
}
