//
//  ButtonUIView.swift
//  CapsuleDesignSystem_Example
//
//  Created by Vinod Rathod on 24/03/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import SwiftUI
import CapsuleDesignSystem

struct ButtonUIView: View {
    @State var isChecked: Bool = false
    
    
    var body: some View {
        VStack(spacing: 30) {
            Toggle("CheckBox", isOn: $isChecked)
                .toggleStyle(
                    CheckToggleStyle(
                        "Small",
                        style: CDSelectionBaseTheme(
                            .standard,
                            styles: [.font(.inter(.extraLight))]))
                )
                .disabled(true)
            
            Toggle("CheckBox", isOn: $isChecked)
                .toggleStyle(CheckToggleStyle("Standard"))
                .disabled(false)
            
            RadioButton("Sandbox",
                        isOn: $isChecked)
            RadioButton("Sandbox",
                        isOn: $isChecked)
            
            Button("Hey Vinod") {
            }.buttonStyle(CDButtonStyle(style: .init(size: .medium, type: .primary)))

        }
    }
}




struct ButtonUIView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonUIView()
    }
}
