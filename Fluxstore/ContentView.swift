//
//  ContentView.swift
//  Fluxstore
//
//  Created by Microloop Bhumi on 8/16/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    var body: some View {
        ZStack{
            if isOnboardingViewActive {
              OnboardingScreenView()
            } else {
                TabbarScreenView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
