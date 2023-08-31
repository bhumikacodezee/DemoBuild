//
//  CreateNewPasswordScreenView.swift
//  Fluxstore
//
//  Created by Microloop Bhumi on 8/29/23.
//

import SwiftUI

struct CreateNewPasswordScreenView: View {
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var showingSheet = false
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 50){
                BackButtonView(action: {
                    presentationMode.wrappedValue.dismiss()
                })
                VStack(alignment: .leading, spacing: 20){
                    HeaderText(text: "Create new password")
                    SubTitleText(text: "Your new password must be different from previously used password")
                }
                VStack(spacing: 50){
                    VStack(spacing: 10){
                        UnderlineTextField(text: $password, placeholder: "Password",isSecure: true,isEyeDisplay:true)
                        UnderlineTextField(text: $confirmPassword, placeholder: "Confirm Password",isSecure: true,isEyeDisplay:true)
                    }
                    BackgroundButtonView(text: "Confirm", backgroundColor: CustomColor.ColorBlack, action: {
                        showingSheet = true
                    })
                    .sheet(isPresented: $showingSheet) {
                        VStack(spacing:40){
                            Image(ImageConstants.ic_confirmpassword)
                                .resizable()
                                .frame(width: 100,height: 100)
                            VStack(spacing:10){
                                Text("Your password has been changed").foregroundColor(CustomColor.ColorBlack)
                                    .font(.customFont(size: 15,weight:.bold))
                                
                                Text("Welcome back! Discover now!").foregroundColor(CustomColor.ColorBlack.opacity(0.5))
                                    .font(.customFont(size: 12,weight:.bold))
                            }
                            BackgroundButtonView(text: "Browse home",backgroundColor: CustomColor.ColorBlack, action: {
                                showingSheet = false
                            }).padding(.bottom,50)
                        }
                        .presentationDetents([.medium, .large])
                    }
                }
                Spacer()
            }.padding(30)
        }.navigationBarHidden(true)
    }
}

struct CreateNewPasswordScreenView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewPasswordScreenView()
    }
}
