import SwiftUI

import Charts



struct Item: Identifiable {
    var id = UUID()
    let type: String
    let value: Double

}



struct DashboardView: View {

    @EnvironmentObject var viewModel: AuthViewModel

    let items: [Item] = [
        Item(type: "A", value: 100),

        Item(type: "B", value: 80),

        Item(type: "C", value: 120),

        Item(type: "D", value: 11),

        Item(type: "E", value: 49),
    ]

    var body: some View {
        if viewModel.currentUser != nil{
            VStack(spacing: 4) {
                Spacer()

                Text("Dashboard")

                Text((viewModel.currentUser!.fullName) + "'s Statistics")
                    .fontWeight(.semibold)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 12)

                ScrollView {
                  //  BarChartView()

                    Chart(items) { item in

                        RuleMark(y: .value("Goal", 71))

                            .foregroundStyle(Color.red)

                            .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))

                        LineMark(

                            x: .value("Application", item.type),

                            y: .value("Hours", item.value)

                        )

                        .foregroundStyle(Color.blue.gradient)

                    }

                    .frame(height:200)

                    .padding()

                    .navigationTitle("Dashboard")

                    .chartYAxis {

                        AxisMarks(position: .leading)

                    }

                    HStack {

                        Image(systemName: "minus")

                            .foregroundColor(Color.red)

                        Text("Goal (Recommended)")

                            .foregroundColor(.secondary)

                        

                    }

                    .font(.caption2)

                    .padding(.leading, 4)

                    

                    

                    Spacer(minLength: 50)

                    

                    Text("Statistics")

                        .font(.title)

                        .bold()

                    

                    // Add user statistics views here

                    Text("Current Screen Time: TODO")

                        .font(.body)

                    

                    Text("Screen Time Goal: \(viewModel.currentUser!.q1, specifier: "%.2f") hour/s")

                        .font(.body)

                    

                    Text("Time Frame to Accomplish Goal: \(viewModel.currentUser!.q2, specifier: "%.2f") week/s")

                        .font(.body)

                    

                    Spacer()

                }

                .padding()

            }

        }

        else {

                LoginView()

            }

    }

}

struct BarChartView: View {
    var body: some View {
        let previousWeek: [StepCount] = [
            StepCount(day: "20220710", steps: 15800),
            StepCount(day: "20220711", steps: 7300),
            StepCount(day: "20220712", steps: 8200),
            StepCount(day: "20220713", steps: 25600),
            StepCount(day: "20220714", steps: 16100),
            StepCount(day: "20220715", steps: 16500),
            StepCount(day: "20220716", steps: 3200)
        ]
       
        let currentWeek: [StepCount] = [
            StepCount(day: "20220717", steps: 4200),
            StepCount(day: "20220718", steps: 15000),
            StepCount(day: "20220719", steps: 2800),
            StepCount(day: "20220720", steps: 10800),
            StepCount(day: "20220721", steps: 5300),
            StepCount(day: "20220722", steps: 10400),
            StepCount(day: "20220723", steps: 4000)
        ]
       
        let stepData = [
            (period: "Previous Week", data: previousWeek),
            (period: "Current Week", data: currentWeek)
        ]
       
        VStack {
            GroupBox ( "Daily Step Count for two weeks") {
                Chart(stepData, id: \.period) { steps in
                    ForEach(steps.data) {
                        LineMark(
                            x: .value("Week Day", $0.shortDay),
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
                    "Screen Time" : Color(hue: 0.10, saturation: 0.70, brightness: 0.90),
                    "Goal": Color(hue: 0.80, saturation: 0.70, brightness: 0.80)
                ])
            }
            .frame(height: 500)
           
            Spacer()
        }
        .padding()
    }
}


struct StepCount: Identifiable {
    let id = UUID()
    let weekday: Date
    let steps: Int
   
    init(day: String, steps: Int) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
       
        self.weekday = formatter.date(from: day) ?? Date.distantPast
        self.steps = steps
    }
   
    var weekdayString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        return  dateFormatter.string(from: weekday)
    }
   
    var shortDay: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return  dateFormatter.string(from: weekday)
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



struct DashboardView_Previews: PreviewProvider {

    static var previews: some View {

        DashboardView()

    }

}
