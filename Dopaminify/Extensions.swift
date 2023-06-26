//
//  Extensions.swift
//  Dopaminify
//
//  Created by Abhiram Nandiraju on 6/18/23.
//

import Foundation
import SwiftUI

extension Text {
    func title() -> some View {
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color( "AccentColor"))
    }
}
