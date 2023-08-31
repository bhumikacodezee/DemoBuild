//
//  TabbarScreenView.swift
//  Fluxstore
//
//  Created by Microloop Bhumi on 8/28/23.
//

import SwiftUI

struct TabbarScreenView: View {
    var body: some View {
        TabView {
          HomeTabScreenView()
            .tabItem({
                Image(ImageConstants.ic_tab_home)
            })
          SearchTabScreenView()
            .tabItem({
              Image(ImageConstants.ic_tab_search)
            })
          StoreTabScreenView()
            .tabItem({
              Image(ImageConstants.ic_tab_store)
            })
          AccountTabScreenView()
            .tabItem({
              Image(ImageConstants.ic_tab_profile)
            })
        }
        .accentColor(CustomColor.ColorBlack)
        .onAppear{
            let image = UIImage.gradientImageWithBounds(
                bounds: CGRect( x: 0, y: 0, width: UIScreen.main.scale, height: 8),
                colors: [
                    UIColor.clear.cgColor,
                    UIColor.black.withAlphaComponent(0.1).cgColor
                ]
            )

            let appearance = UITabBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = UIColor.white
                    
            appearance.backgroundImage = UIImage()
            appearance.shadowImage = image

            UITabBar.appearance().standardAppearance = appearance

        }
    }
}

struct TabbarScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarScreenView()
    }
}
extension UIImage {
    static func gradientImageWithBounds(bounds: CGRect, colors: [CGColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
}
