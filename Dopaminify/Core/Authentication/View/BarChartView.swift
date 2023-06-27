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

            

            StepCount(weekday: "Sun", steps: 15800),

            StepCount(weekday: "Mon", steps: 7300),

            StepCount(weekday: "Tue", steps: 8200),

            StepCount(weekday: "Wed", steps: 25600),

            StepCount(weekday: "Thu", steps: 16100),

            StepCount(weekday: "Fri", steps: 16500),

            StepCount(weekday: "Sat", steps: 3200)

        ]

       

        let goalScreenTime: [StepCount] = [

            StepCount(weekday: "Sun", steps: 4200),

            StepCount(weekday: "Mon", steps: 15000),

            StepCount(weekday: "Tue", steps: 2800),

            StepCount(weekday: "Wed", steps: 10800),

            StepCount(weekday: "Thu", steps: 5300),

            StepCount(weekday: "Fri", steps: 10400),

            StepCount(weekday: "Sat", steps: 4000)

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

            .groupBoxStyle(YellowGroupBoxStyle())

           

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
