//
//  ChipsStyle.swift
//  CapsuleDesignSystem
//
//  Created by Vinod Rathod on 11/04/22.
//

import Foundation
import SwiftUI


struct CDChipButton: View {
    
    @Environment(\.isEnabled) private var isEnabled
    
    public init(_ title: String,
                subTitle: String? = nil,
                leftIcon: Image? = nil,
                hasClose: Bool = false) {
        
    }
    
    public var body: some View {
        Button {
            <#code#>
        } label: {
            return HStack(spacing: 11) {
                leftIcon?
                    .resizable()
                    .frame(maxWidth: 18, maxHeight: 18, alignment: .leading)
                configuration
                    .label
                    .font(style.font)
                    .foregroundColor(foreground)
                rightIcon?
                    .resizable()
                    .frame(maxWidth: 18, maxHeight: 18, alignment: .trailing)
            }
            .padding(.horizontal, style.size.padding.horizontal)
            .padding(.vertical, style.size.padding.vertical)
            .background(background)
            .clipShape(Capsule())
            .overlay(
                style.type == .secondary ? RoundedRectangle(cornerRadius: 4)
                    .stroke(foreground, lineWidth: 2) : nil
            )
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.spring())
        }

    }
}
