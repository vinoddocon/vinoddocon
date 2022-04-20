//
//  Styling.swift
//  CapsuleDesignSystem
//
//  Created by Vinod Rathod on 11/04/22.
//

import SwiftUI


public enum CDTheme {
    case font(Font)
    case textColor(Color)
    case primaryColor(Color)
    case disabledColor(Color)
}

public class CDBaseTheme {
    public var font: Font = .inter(.regular, size: 16)
    public var textColor: Color = .black
    public var primaryColor: Color = .Primary.doconBlue
    public var disabledColor: Color = .Neutral.disabled
    
    public init(_ styles: [CDTheme]) {
        for style in styles {
            switch style {
            case let .font(value):
                self.font = value
            case let .primaryColor(color):
                self.primaryColor = color
            case let .textColor(color):
                self.textColor = color
            case let .disabledColor(color):
                self.disabledColor = color
            }
        }
    }
}

public class CDSelectionBaseTheme: CDBaseTheme {
    public var size: SelectionControlSize
    
    public init(_ size: SelectionControlSize, styles: [CDTheme] = []) {
        self.size = size
        super.init(styles)
    }
}

public class CDButtonBaseTheme: CDBaseTheme {
    public var size: CDButtonStyle.Size
    public var type: CDButtonStyle.`Type`
    
    public init(size: CDButtonStyle.Size,
                type: CDButtonStyle.`Type`,
                styles: [CDTheme] = []) {
        self.size = size
        self.type = type
        
        let containsFont = styles.contains {
            if case .font(_) = $0 { return true }
            return false
        }
        
        let containsTextColor = styles.contains {
            if case .textColor(_) = $0 { return true }
            return false
        }
        
        var updatedStyles = styles
        
        /// return default font style with font size according to the button size.
        if !containsFont {
            updatedStyles.append(.font(.inter(.regular, size: size.fontSize)))
        }
        
        /// updates textColor because by default textColor is black.
        if !containsTextColor {
            updatedStyles.append(.textColor(.white))
        }
        
        super.init(updatedStyles)
    }

}
