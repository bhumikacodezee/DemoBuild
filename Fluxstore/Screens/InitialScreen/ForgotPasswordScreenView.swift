//
//  ForgotPasswordScreenView.swift
//  Fluxstore
//
//  Created by Microloop Bhumi on 8/29/23.
//

import SwiftUI

struct ForgotPasswordScreenView: View {
    @State private var emailAddress: String = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 50){
                BackButtonView(action: {
                    presentationMode.wrappedValue.dismiss()
                })
                VStack(alignment: .leading, spacing: 20){
                    HeaderText(text: "Forgot Password?")
                    SubTitleText(text: "Enter email associated with your account and we’ll send and email with intructions to reset your password")
                }
                VStack(spacing: 50){
                    VStack(spacing: 10){
                        UnderlineTextField(text: $emailAddress, placeholder: "enter your email here",imageName: ImageConstants.ic_email)
                    }
                    NavigationLink {
                        VerificationCodeScreenView()
                    } label: {
                        BackgroundButtonView(text: "Forgot Password", allowHitTest: false, action: { })
                    }
                }
                Spacer()
            }.padding(30)
        }.navigationBarHidden(true)
    }
}

struct ForgotPasswordScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordScreenView()
    }
}
