//  BarChartView.swift
//  Dopaminify
//  Created by Ayush on 6/26/23.

import SwiftUI
import Charts
import WebKit

struct Item: Identifiable {
    var id = UUID()
    let type: String
    let value: Double
}

struct DashboardView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    init() {
        if let bundlePath = Bundle.main.path(forResource: "google-charts", ofType: "html") {
            print("HTML file path: \(bundlePath)")
        } else {
            print("HTML file not found in the app bundle")
        }
        let webView = WKWebView(frame: .zero)
        self.webView = webView

        if let htmlPath = Bundle.main.path(forResource: "google-charts", ofType: "html") {
            let htmlURL = URL(fileURLWithPath: htmlPath)
            webView.loadFileURL(htmlURL, allowingReadAccessTo: htmlURL.deletingLastPathComponent())
        }
    }


    let items: [Item] = [
        Item(type: "A", value: 100),
        Item(type: "B", value: 80),
        Item(type: "C", value: 120),
        Item(type: "D", value: 11),
        Item(type: "E", value: 49),
    ]
    
    var webView: WKWebView!

    var body: some View {
        if viewModel.currentUser != nil{
            VStack(spacing: 4) {
                Spacer()
                Text(viewModel.currentUser?.fullName ?? "Your")
                Text("Statistics")
                    .fontWeight(.semibold)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 12)

                VStack {
                    Spacer()

                    // Chart View
                    WebView(webView: webView)
                    .frame(width: 500, height: 400) // Adjust size as needed

                    Spacer()
                    }
                    .alignmentGuide(.top) { _ in UIScreen.main.bounds.size.height / 2 }
                    .frame(maxHeight: .infinity)

                    Spacer()
                ScrollView {
                    
                    
                    //BarChartView()

                    /*Chart(items) { item in
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

                    Text("Additional Info")
                        .font(.title)
                        .bold() */

                    // Add user statistics views here
                    Text("Current Screen Time: TODO")
                        .font(.body)
                    
                    Text("Screen Time Goal: \(viewModel.currentUser!.q1, specifier: "%.1f") hour/s")
                        .font(.body)

                    Text("Time Frame: \(viewModel.currentUser!.q2, specifier: "%.0f") week/s")
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

/*struct DashboardView_Previews: PreviewProvider {

 static var previews: some View {
        DashboardView()
   }
} */

struct WebView: UIViewRepresentable {
    
    let webView: WKWebView

    func makeUIView(context: Context) -> WKWebView {
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // No need for updates in this case
    }
}
