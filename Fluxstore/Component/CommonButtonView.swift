//
//  CommonButtonView.swift
//  Fluxstore
//
//  Created by Microloop Bhumi on 8/17/23.
//

import SwiftUI

struct CommonButtonView: View {
    @State var text: String
    
    var body: some View {
        ZStack{
            Text(text)
                .foregroundColor(CustomColor.ColorWhite)
                .font(.customFont(size: 16, weight: .bold))
                .frame(maxWidth: .infinity)
                .padding()
        }.background(CustomColor.ColorWhite.opacity(0.25))
            .overlay(
                Capsule()
                    .stroke(CustomColor.ColorWhite, lineWidth: 2)
            )
            .clipShape(Capsule())
        
        
    }
}
struct BackgroundButtonView: View {
    @State var text: String
    @State var allowHitTest : Bool = true
    @State var backgroundColor : Color = CustomColor.ColorBrown2D201C
    var action: () -> Void
    var body: some View {
        if allowHitTest{
            Button(action: {
                self.action()
            }) {
                Text(text)
                    .foregroundColor(CustomColor.ColorWhite)
                    .font(.customFont(size: 16, weight: .bold))
                    .padding(.horizontal,50)
                    .padding(.vertical,16)
                    .background(backgroundColor)
                    .clipShape(Capsule())
            }
        }
        else{
            Text(text)
                .foregroundColor(CustomColor.ColorWhite)
                .font(.customFont(size: 16, weight: .bold))
                .padding(.horizontal,50)
                .padding(.vertical,16)
                .background(backgroundColor)
                .clipShape(Capsule())
        }
    }
}
struct BackButtonView: View {
    var action: () -> Void
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Image(ImageConstants.ic_back)
                .resizable()
                .frame(width: 36,height: 36)
        }
    }
}
struct CommonButtonView_Previews: PreviewProvider {
    static var previews: some View {
//        BackgroundButtonView(text: "SIGN UP", action: {})
        BackButtonView(action: {})
    }
}
