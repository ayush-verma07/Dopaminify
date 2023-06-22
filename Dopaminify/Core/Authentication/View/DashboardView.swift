import SwiftUI
import Charts

struct Item: Identifiable {
    var id = UUID()
    let type: String
    let value: Double
}

struct DashboardView: View {
    
    let items: [Item] = [
        Item(type: "A", value: 100),
        Item(type: "B", value: 80),
        Item(type: "C", value: 120),
        Item(type: "D", value: 11),
        Item(type: "E", value: 49),
        
    ]
    
    var body: some View {
        VStack(spacing: 4) {
            Spacer()
            Text("Screen Time (Hours)")
            
            Text("Total: 360")
                .fontWeight(.semibold)
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.bottom, 12)
            ScrollView {
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
                
                // Add your user statistics views here
                Text("Total Screen Time: 4 hours")
                    .font(.body)
                
                Text("Work Time: 2 hours")
                    .font(.body)
                
                Text("Entertainment Time: 1.5 hours")
                    .font(.body)
                
                Text("Other Time: 30 minutes")
                    .font(.body)
                
                Spacer()
            }
            .padding()
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
