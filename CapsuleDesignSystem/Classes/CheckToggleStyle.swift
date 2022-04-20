//
//  CheckBoxView.swift
//  CapsuleDesignSystem
//
//  Created by Vinod Rathod on 03/04/22.
//

import SwiftUI

public struct CheckToggleStyle: ToggleStyle {
    @Environment(\.isEnabled) private var isEnabled
    var textString: String
    var style: CDSelectionBaseTheme
    
    public init(_ textString: String, style: CDSelectionBaseTheme = CDSelectionBaseTheme(.standard)) {
        self.textString = textString
        self.style = style
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                ZStack {
                    switch configuration.isOn {
                    case true:
                        if isEnabled {
                            style.primaryColor.edgesIgnoringSafeArea(.all)
                        } else {
                            style.disabledColor.edgesIgnoringSafeArea(.all)
                        }
                    case false:
                        Color.white.edgesIgnoringSafeArea(.all)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(Color.Neutral.grey, lineWidth: 1)
                            )
                    }
                    if configuration.isOn {
                        Image("checkmark-white", bundle: BundleToken.resourceBundle)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(isEnabled ? Color.white : Color.Neutral.grey)
                            .padding(.horizontal, style.size.padding.horizontal)
                            .padding(.vertical, style.size.padding.vertical)
                    }
                }
                .frame(width: style.size.rawValue, height: style.size.rawValue, alignment: .center)
                .cornerRadius(2)
                
                Text(textString)
                    .font(style.font)
                    .foregroundColor(style.textColor)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

final class BundleToken {
    static let bundle: Bundle = {
        return Bundle(for: BundleToken.self)
    }()
    
    static let resourceBundle: Bundle? = {
        let url = bundle.resourceURL?.appendingPathComponent("CapsuleDesignSystem.bundle")
        return Bundle(url: url!)
    }()
}

public enum SelectionControlSize: CGFloat {
    case small = 16
    case standard = 20
    
    var padding: (horizontal: CGFloat, vertical: CGFloat) {
        switch self {
        case .small:
            return (3.5, 4)
        case .standard:
            return (4, 5)
        }
    }
}
