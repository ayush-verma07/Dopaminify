//  BarChartView.swift
//  Dopaminify
//  Created by Ayush on 6/26/23.

import SwiftUI
import Charts

struct BarChartView: View {
    @EnvironmentObject var questionnaireManager: QuestionnaireManager
    @EnvironmentObject var authModel: AuthViewModel

    var body: some View {

        let currentScreenTime: [StepCount] =

        [
            StepCount(weekday: "Sun", steps: 7),
            StepCount(weekday: "Mon", steps: 9),
            StepCount(weekday: "Tue", steps: 11),
            StepCount(weekday: "Wed", steps: 10),
            StepCount(weekday: "Thu", steps: 3),
            StepCount(weekday: "Fri", steps: 7),
            StepCount(weekday: "Sat", steps: 8)
        ]

       

        let goalScreenTime: [StepCount] = [
            StepCount(weekday: "Sun", steps: 11),
            StepCount(weekday: "Mon", steps: 10),
            StepCount(weekday: "Tue", steps: 9),
            StepCount(weekday: "Wed", steps: 8),
            StepCount(weekday: "Thu", steps: 7),
            StepCount(weekday: "Fri", steps: 6),
            StepCount(weekday: "Sat", steps: 5)
        ]
        let stepData = [
            (period: "Current Screen Time", data: currentScreenTime),
            (period: "Goal Screen Time", data: goalScreenTime)
        ]

        VStack (alignment: .center) {
            GroupBox () {
                Chart(stepData, id: \.period) { steps in
                    ForEach(steps.data) {
                        BarMark(
                            x: .value("Week Day", $0.weekdayString),
                            y: .value("Step Count", $0.steps)
                        )
                        .foregroundStyle(by: .value("Week", steps.period))
                        .position(by: .value("week", steps.period))
                    }
                }
                .chartYAxis {
                    AxisMarks(position: .leading)
                }
                .chartForegroundStyleScale([
                    "Current Screen Time" : Color(hue: 0.10, saturation: 0.70, brightness: 0.90),
                    "Goal Screen Time": Color(hue: 0.80, saturation: 0.70, brightness: 0.80)
                ])
            }
            .frame(height: 500)
            //.groupBoxStyle(YellowGroupBoxStyle())
            
            Spacer()
        }
        .padding()
    }
}

struct StepCount: Identifiable {

    let id = UUID()
    let weekday: String
    let steps: Int

    init(weekday: String, steps: Int) {
        
        self.weekday = weekday
        self.steps = steps
    }

    var weekdayString: String {
        return weekday
    }
}

struct YellowGroupBoxStyle: GroupBoxStyle {

    func makeBody(configuration: Configuration) -> some View {

        configuration.content

            .padding(.top, 30)

            .padding(20)

            .background(Color(hue: 0.10, saturation: 0.04, brightness: 1.0))

            .cornerRadius(20)

            .overlay(

                configuration.label.padding(10),

                alignment: .topLeading

            )

    }

}



struct BarChartView_Previews: PreviewProvider {

    static var previews: some View {

        BarChartView()
    }
}
