//
//  ButtonStyle.swift
//  CapsuleDesignSystem
//
//  Created by Vinod Rathod on 24/03/22.
//

import SwiftUI

public struct CDButtonStyle : ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    
    public let leftIcon: Image?
    public let rightIcon: Image?
    public let style: CDButtonBaseTheme
    
    public init(style:CDButtonBaseTheme = CDButtonBaseTheme(size: .medium,
                                                            type: .primary),
                leftIcon: Image? = nil,
                rightIcon: Image? = nil) {
        self.style = style
        self.leftIcon = leftIcon
        self.rightIcon = rightIcon
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        var background: Color
        var foreground: Color
        var cornerRadius: CGFloat
        
        switch style.type {
        case .primary:
            background = isEnabled ? style.primaryColor : style.disabledColor
            foreground = style.textColor
            cornerRadius = 4
        case .secondary:
            background = .white
            foreground = isEnabled ? style.primaryColor : style.disabledColor
            cornerRadius = 4
        case .tertiary:
            background = .clear
            foreground = isEnabled ? style.primaryColor : style.disabledColor
            cornerRadius = 0
        }
        
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
        .cornerRadius(cornerRadius)
        .overlay(
            style.type == .secondary ? RoundedRectangle(cornerRadius: 4)
                .stroke(foreground, lineWidth: 2) : nil
        )
        .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
        .animation(.spring())
        
        
    }

}

extension CDButtonStyle {
    public enum Size: CGFloat {
        case small = 32
        case medium = 40
        case large = 48
        
        var padding: (horizontal: CGFloat, vertical: CGFloat) {
            switch self {
            case .small:
                return (21, 8)
            case .medium:
                return (22, 10)
            case .large:
                return (22, 12)
            }
        }
        
        var fontSize: CGFloat {
            switch self {
            case .small:
                return 12
            case .medium:
                return 14
            case .large:
                return 14
            }
        }
    }
    
    
    public enum `Type` {
        case primary
        case secondary
        case tertiary
    }
}

