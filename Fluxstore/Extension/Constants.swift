//
//  Constants.swift
//  DemoSwiftUI
//
//  Created by Microloop Bhumi on 7/14/23.
//

import UIKit
import SwiftUI

struct ImageConstants {
    static let kSplashBg = "ic_splash_bg"
    static let ic_onboarding1 = "ic_onboarding1"
    static let ic_onboarding2 = "ic_onboarding2"
    static let ic_onboarding3 = "ic_onboarding3"
    static let ic_login_apple = "ic_login_apple"
    static let ic_login_facebook = "ic_login_facebook"
    static let ic_login_google = "ic_login_google"
    static let ic_back = "ic_back"
    static let ic_email = "ic_email"
    static let ic_confirmpassword = "ic_confirmpassword"
    static let ic_tab_home = "ic_tab_home"
    static let ic_tab_profile = "ic_tab_profile"
    static let ic_tab_search = "ic_tab_search"
    static let ic_tab_store = "ic_tab_store"
}

struct CustomColor {
    static let ColorBlack = Color("ColorBlack")
    static let ColorWhite = Color("ColorWhite")
    static let ColorBlack464447 = Color("ColorBlack464447")
    static let ColorGreyE7E8E9 = Color("ColorGreyE7E8E9")
    static let ColorGreyD6D6D6 = Color("ColorGreyD6D6D6")
    static let ColorBrown2D201C = Color("ColorBrown2D201C")
}
import SwiftUI

enum FontFamily {
    case ProductSans
   
    func font(ofSize fontSize: CGFloat, weight: Font.Weight) -> Font {
        switch self {
        case .ProductSans:
            switch weight {
            case .bold: return .custom("Product Sans Bold", size: fontSize)
            case .regular: return .custom("ProductSans-Regular", size: fontSize)
            case .light: return .custom("ProductSans-Light", size: fontSize)
            default: return .system(size: fontSize, weight: weight)
            }
        }
    }
}
extension Font {
    static func customFont(family: FontFamily = .ProductSans,
                           size fontSize: CGFloat,
                           weight: Font.Weight = .regular) -> Font {
        return family.font(ofSize: fontSize, weight: weight)
    }
}
