//
//  FontExtension.swift
//  CapsuleDesignSystem
//
//  Created by Vinod Rathod on 06/04/22.
//

import SwiftUI

public enum FontFamily {
    public enum Inter: String {
        case regular = "Inter-Regular"
        case bold = "Inter-Bold"
        case semiBold = "Inter-SemiBold"
        case medium = "Inter-Medium"
        case thin = "Inter-Thin"
        case light = "Inter-Light"
        case extraLight = "Inter-ExtraLight"
        case extraBold = "Inter-ExtraBold"
        case black = "Inter-Black"
        
        var fontConvertile: FontConvertible {
            return .init(name: rawValue, family: "Inter", path: "\(rawValue).ttf")
        }
    }
}

public struct FontConvertible {
  public let name: String
  public let family: String
  public let path: String

  public func font(size: CGFloat) -> Font {
    return Font.custom(font: self, size: size)
  }

  public func register() {
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    return BundleToken.resourceBundle?.url(forResource: path, withExtension: nil)
  }
}

public extension Font {
    internal static func custom(font: FontConvertible, size: CGFloat) -> Font {
        if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
            font.register()
        }
        return Font.custom(font.name, size: size)
    }
    
    static func inter(_ inter: FontFamily.Inter, size: CGFloat = 16) -> Font {
        custom(font: inter.fontConvertile, size: size)
    }
}
