//
//  OnboardingScreenView.swift
//  Fluxstore
//
//  Created by Microloop Bhumi on 8/28/23.
//

import SwiftUI

struct OnboardingScreenView: View {
    @State private var isSubmitButton = false
    var body: some View {
        
        NavigationView {
            ZStack {
                Image(ImageConstants.kSplashBg)
                    .resizable()
                    .scaledToFill()
                Rectangle().background(CustomColor.ColorBlack).opacity(0.5)
                
                VStack {
                    Spacer()
                    VStack(spacing: 80) {
                        VStack(spacing: 20){
                            Text("Welcome to Fluxstore!").foregroundColor(CustomColor.ColorWhite)
                                .font(.customFont(size: 25, weight: .bold))
                            Text("The home for a fashionista").foregroundColor(CustomColor.ColorWhite)
                                .font(.customFont(size: 16))
                                            
                        }
                        
                        
                        NavigationLink {
                            OnboardingListScreenView()
                        } label: {
                            CommonButtonView(text:"Get Started").padding(.horizontal,100)
                        }

                    }.frame( maxWidth: .infinity)
                        
                        
                }
                .padding(.bottom, 100.0)
                
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct OnboardingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreenView()
    }
}
