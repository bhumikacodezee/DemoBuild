//
//  SignUpScreenView.swift
//  Fluxstore
//
//  Created by Microloop Bhumi on 8/29/23.
//

import SwiftUI

struct SignUpScreenView: View {
    @State private var name: String = ""
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 40){
                HeaderText(text: "Create\nyour account")
                ScrollView(showsIndicators: false){
                    VStack(spacing: 40){
                        VStack(spacing: 10){
                            UnderlineTextField(text: $name, placeholder: "Enter your name")
                            UnderlineTextField(text: $emailAddress, placeholder: "Email Address")
                            UnderlineTextField(text: $password, placeholder: "Password",isSecure: true)
                            UnderlineTextField(text: $confirmPassword, placeholder: "Confirm Password",isSecure: true)
                        }
                        BackgroundButtonView(text: "SIGN UP", action: {
                            isOnboardingViewActive = false
                        })
                        SocialLoginView(text: "or sign up with", appleAction: {}, facebookAction: {}, googleAction: {})
                        HStack{
                            Text("Already have account").foregroundColor(CustomColor.ColorBlack)
                                .font(.customFont(size: 14))
                            NavigationLink {
                                SignInScreenView()
                            } label: {
                                Text("Log In").foregroundColor(CustomColor.ColorBlack)
                                    .font(.customFont(size: 14))
                                    .underline()
                            }
                        }
                    }
                   
                }
            }.padding(30)
        }.navigationBarHidden(true)
    }
}

struct SignUpScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreenView()
    }
}
