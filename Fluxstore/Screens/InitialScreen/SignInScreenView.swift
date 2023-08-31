//
//  SignInScreenView.swift
//  Fluxstore
//
//  Created by Microloop Bhumi on 8/29/23.
//

import SwiftUI

struct SignInScreenView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var path: [Int] = []
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 40){
                HeaderText(text: "Log into\nyour account")
                ScrollView(showsIndicators: false){
                    VStack(spacing: 40){
                        VStack(spacing: 10){
                            UnderlineTextField(text: $emailAddress, placeholder: "Email Address")
                            UnderlineTextField(text: $password, placeholder: "Password",isSecure: true)
                            HStack(){
                                Spacer()
                                NavigationLink {
                                    ForgotPasswordScreenView()
                                } label: {
                                    Text("Forgot Password?").foregroundColor(CustomColor.ColorBlack.opacity(0.6))
                                        .font(.customFont(size: 14))
                                        .underline()
                                }
                            }
                        }
                        
                        BackgroundButtonView(text: "LOGIN", action: {
                            self.isOnboardingViewActive = false
                        })
                        
                        SocialLoginView(text: "or login with", appleAction: {}, facebookAction: {}, googleAction: {})
                        HStack{
                            Text("Don't have an account").foregroundColor(CustomColor.ColorBlack)
                                .font(.customFont(size: 14))
                            Button (action: { presentationMode.wrappedValue.dismiss() } ){
                                Text("Sign Up").foregroundColor(CustomColor.ColorBlack)
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

struct SignInScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreenView()
    }
}
