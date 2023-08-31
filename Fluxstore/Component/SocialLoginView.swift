//
//  SocialLoginView.swift
//  Fluxstore
//
//  Created by Microloop Bhumi on 8/29/23.
//

import SwiftUI

struct SocialLoginView: View {
    @State var text : String
    var appleAction: () -> Void
    var facebookAction: () -> Void
    var googleAction: () -> Void
    var body: some View {
        VStack(spacing:20){
            Text(text)
                .foregroundColor(CustomColor.ColorBlack.opacity(0.5))
                    .font(.customFont(size: 14))
            HStack(spacing:30){
                Button(action: {
                    self.appleAction()
                }) {
                    Image(ImageConstants.ic_login_apple)
                        .resizable()
                        .frame(width: 42,height: 42)
                }
                Button(action: {
                    self.googleAction()
                }) {
                    Image(ImageConstants.ic_login_google)
                        .resizable()
                        .frame(width: 42,height: 42)
                }
                Button(action: {
                    self.facebookAction()
                }) {
                    Image(ImageConstants.ic_login_facebook)
                        .resizable()
                        .frame(width: 42,height: 42)
                }
                
            }
        }
    }
}

struct SocialLoginView_Previews: PreviewProvider {
    static var previews: some View {
        SocialLoginView(text: "or sign up with",appleAction: {},facebookAction: {},googleAction: {})
    }
}
