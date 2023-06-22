//
//  AboutView.swift
//  Dopaminify
//
//  Created by Ayush on 6/19/23.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
                VStack {
                    Image("testy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .padding(.top, 30)
                    
                Text("About Us")
                    .font(.title)
                    .bold()
                    .padding(.top, 20)
                
                Text("What is Dopaminify?")
                    .font(.system(size: 14))
                    .bold()
                    .padding(.top, 10)
                
                Text("Dopaminify is an innovative app designed to help users break free from the \(Text("social media dopamine loop ").italic())and regain control over their screen time. With a user-centric interface built using SwiftUI, Dopaminify allows individuals, especially teens, to set their desired screen time goals through a series of personalized questions. Leveraging Apple's Screen Time API along with Google’s Chart API, the app is able to generate insightful charts that compare their goals with their actual screen time, empowering users to make informed decisions about their digital habits. With the ability to create accounts and update goals, Dopaminify offers a convenient and flexible solution for users to track and manage their screen time consistently.")
                        .font(.system(size: 10))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 30)
                        .padding(.top, 1)
                
                                
                Text("How does Dopamine shape social media?")
                    .bold()
                    .font(.system(size: 14))
                    .padding(.top, 10)
                
                Text("In the social media context, the dopamine loop refers to a cycle of reward-seeking behavior driven by the release of dopamine, a neurotransmitter associated with pleasure and motivation. Social media platforms are designed to exploit this loop by providing users with instant gratification through likes, comments, and notifications, triggering the release of dopamine in the brain. As users scroll through endless feeds, watch engaging videos, and receive social validation, they become hooked on the constant anticipation of these rewards, leading to repetitive and addictive behavior as they seek to sustain the pleasurable sensations. This dopamine loop can contribute to excessive screen time, reduced productivity, and potential negative impacts on mental well-being.")
                    .font(.system(size: 10))
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 30)
                    .padding(.top, 1)
                    
                    Text("Why Us?")
                        .bold()
                        .font(.system(size: 14))
                        .padding(.top, 10)
                    
                    Text("As teens, ourselves, who also spend time scrolling on various social media platforms, we have personally experienced the negative aspects of excessive screen time. Recognizing the addictive nature of social media and its destructive effects on productivity, well-being, and routine, we were both desperate for a solution. Therefore, Dopaminify was created. Fueled by our desire to regain control over our digital habits and our personal experiences, to create an app that empowers users, especially fellow teens, to set and achieve their desired screen time goals, was a personal goal of ours.")
                        .font(.system(size: 10))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 30)
                        .padding(.top, 1)
                    
                    
                    Text("Created by Ayush Verma & Abhiram Nandiraju")
                        .font(.system(size: 8))
                        .padding(.top, 10)
                            }

            }
        }
        
    }
    


struct FeatureRow: View {
    let imageName: String
    let text: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: imageName)
                .foregroundColor(.blue)
            
            Text(text)
                .foregroundColor(.black)
                .font(.body)
            
            Spacer()
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
