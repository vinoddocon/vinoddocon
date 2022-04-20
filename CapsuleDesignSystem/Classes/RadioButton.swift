//
//  RadioButton.swift
//  CapsuleDesignSystem
//
//  Created by Vinod Rathod on 06/04/22.
//

import SwiftUI

public struct RadioButton: View {
    let text: String?
    @Binding var isOn: Bool
    let style: CDSelectionBaseTheme
    
    
    public init(_ text: String? = nil,
                isOn: Binding<Bool>,
                style: CDSelectionBaseTheme = CDSelectionBaseTheme(.standard)) {
        self.text = text
        self._isOn = isOn
        self.style = style
    }
    
    public var body: some View {
        Button(action: {
            isOn.toggle()
        }) {
            HStack {
                ZStack {
                    Circle()
                        .stroke(style.primaryColor, lineWidth: 1)
                        .overlay(
                            Circle()
                                .fill(isOn ? style.primaryColor : .clear)
                                .frame(width: style.size.rawValue / 2, height: style.size.rawValue / 2)
                        )
                        .frame(width: style.size.rawValue, height: style.size.rawValue)
                }
                if let string = self.text {
                    Text(string)
                        .foregroundColor(style.textColor)
                        .font(style.font)
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
