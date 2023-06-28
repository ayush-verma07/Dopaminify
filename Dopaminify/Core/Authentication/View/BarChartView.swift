//  BarChartView.swift
//  Dopaminify
//  Created by Ayush on 6/26/23.

import DeviceActivity

import SwiftUI

import Charts



struct BarChartView: View {

    @EnvironmentObject var questionnaireManager: QuestionnaireManager

    @EnvironmentObject var authModel: AuthViewModel

//    @EnvironmentObject var screenTime: ScreenTimeModel

    

    var body: some View {

        if authModel.currentUser != nil {

            //goal: 5 hours

            //currently at: 9 hours

            //time frame: 1 week: week*7 = 7 days

            //current - goal = 4 hours

            //that value / time frame = 4/7

            //sunday: currently at - 4/7

            

            let goal: Double = authModel.currentUser!.q1

            let timeFrame: Double = authModel.currentUser!.q2 * 7

            let currentScreenTimeA: Double = 15

            let dailyScreenTime: Double = (currentScreenTimeA - goal) / timeFrame

//            var dailyGoals: [Double] =

//            [

//            print(goal - (1)*dailyScreenTime)

//            print(goal - (1)*dailyScreenTime)

//            print(goal - (1)*dailyScreenTime)

//            print(goal - (1)*dailyScreenTime)

//            print(goal - (1)*dailyScreenTime)

//            print(goal - (1)*dailyScreenTime)

//            print(goal - (1)*dailyScreenTime)

            

//            ]


            //api call for current screen time

            let currentScreenTime: [StepCount] =

                    [
                        StepCount(weekday: "Sun", steps: currentScreenTimeA),

                        StepCount(weekday: "Mon", steps: currentScreenTimeA),

                        StepCount(weekday: "Tue", steps: currentScreenTimeA),

                        StepCount(weekday: "Wed", steps: currentScreenTimeA),

                        StepCount(weekday: "Thu", steps: currentScreenTimeA),

                        StepCount(weekday: "Fri", steps: currentScreenTimeA),

                        StepCount(weekday: "Sat", steps: currentScreenTimeA)
                    ]

            let goalScreenTime: [StepCount] = [

                StepCount(weekday: "Sun", steps: currentScreenTimeA - (1)*dailyScreenTime),

                StepCount(weekday: "Mon", steps: currentScreenTimeA - (2)*dailyScreenTime),

                StepCount(weekday: "Tue", steps: currentScreenTimeA - (3)*dailyScreenTime),

                StepCount(weekday: "Wed", steps: currentScreenTimeA - (4)*dailyScreenTime),

                StepCount(weekday: "Thu", steps: currentScreenTimeA - (5)*dailyScreenTime),

                StepCount(weekday: "Fri", steps: currentScreenTimeA - (6)*dailyScreenTime),

                StepCount(weekday: "Sat", steps: currentScreenTimeA - (7)*dailyScreenTime)

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

                                x: .value("Week Day", $0.weekday),

                                y: .value("Step Count", $0.steps)

                            )

                            .foregroundStyle(by: .value("Week", steps.period))

                            .position(by: .value("week", steps.period))

//                            .annotation(position: .overlay, alignment: .center){

//                                Text("0")

//                            }

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

}

struct StepCount: Identifiable {

    let id = UUID()

    let weekday: String

    let steps: Double

   

    init(weekday: String, steps: Double) {



        self.weekday = weekday

        self.steps = steps

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

//func printGoals(dailyScreenTime: Double, goal: Double) {

//    print(goal - (1)*dailyScreenTime)

//    print(goal - (2)*dailyScreenTime)

//    print(goal - (3)*dailyScreenTime)

//    print(goal - (4)*dailyScreenTime)

//    print(goal - (5)*dailyScreenTime)

//    print(goal - (6)*dailyScreenTime)

//    print(goal - (7)*dailyScreenTime)

//}



//struct BarChartView_Previews: PreviewProvider {

//    static var previews: some View {

//        BarChartView()

//    }

//}
