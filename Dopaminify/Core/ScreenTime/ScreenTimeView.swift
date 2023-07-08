//
//  ScreenTimeView.swift
//  Dopaminify
//
//  Created by Ayush on 7/2/23.
//

import SwiftUI
import FamilyControls

struct ScreenTimeView: View {
    @StateObject var model = MyScreenModel.shared
    @State var isPresented = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        if(model.isAuthorized) {
            Button("Select Apps to Discourage") {
                isPresented = true
            }
            .familyActivityPicker(isPresented: $isPresented, selection: $model.selectionToDiscourage)
            Button("Start Monitoring") {
                model.initiateMonitoring()
            }
        } else {
            Text("You have not authorized")
                .font(.system(size: 14))
                .bold()
                .padding(.top, 10)
            Button("Close") {
                //isPresented = false
                dismiss()
            }
        }
    }
}

struct ScreenTimeView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenTimeView()
    }
}
