//
//  AccountTabScreenView.swift
//  Fluxstore
//
//  Created by Microloop Bhumi on 8/29/23.
//

import SwiftUI

struct AccountTabScreenView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    var body: some View {
        BackgroundButtonView(text: "Logout", action: {
            isOnboardingViewActive = true
        })
    }
}

struct AccountTabScreenView_Previews: PreviewProvider {
    static var previews: some View {
        AccountTabScreenView()
    }
}
