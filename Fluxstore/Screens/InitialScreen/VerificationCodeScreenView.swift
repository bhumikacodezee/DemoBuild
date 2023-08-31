//
//  VerificationCodeScreenView.swift
//  Fluxstore
//
//  Created by Microloop Bhumi on 8/29/23.
//

import SwiftUI

struct VerificationCodeScreenView: View {
    @State private var emailAddress: String = ""
    @State var otpCode: String = ""
    @State var otpCodeLength: Int = 4
    @State var textSize = CGFloat(27)
    @Environment(\.presentationMode) var presentationMode
    @State private var path = NavigationPath()
    @State var isOTPComplete: Bool = false
    var body: some View {
        NavigationView{
            NavigationStack{
                VStack(alignment: .leading, spacing: 50){
                    BackButtonView(action: {
                        presentationMode.wrappedValue.dismiss()
                    })
                    VStack(alignment: .leading, spacing: 8){
                        HeaderText(text: "Verification code")
                        SubTitleText(text: "Please enter the verification code we sent to your email address")
                    }
                    
                    OtpView_SwiftUI(otpCode: $otpCode, otpCodeLength: otpCodeLength, textColor: CustomColor.ColorBlack, textSize: textSize) {
                        isOTPComplete = true
                    }
                    .navigationDestination(
                        isPresented: $isOTPComplete) {
                            CreateNewPasswordScreenView()
                            Text("")
                                .hidden()
                        }
                    
                    Text("Resend in 00:10").foregroundColor(CustomColor.ColorBlack.opacity(0.5))
                        .font(.customFont(size: 14,weight:.light))
                    Spacer()
                }.padding(30)
            }
        }.navigationBarHidden(true)
    }
}

struct VerificationCodeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationCodeScreenView(isOTPComplete: false)
    }
}
