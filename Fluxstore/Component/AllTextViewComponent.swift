//
//  AllTextViewComponent.swift
//  Fluxstore
//
//  Created by Microloop Bhumi on 8/29/23.
//

import SwiftUI

struct HeaderText: View {
    @State var text: String = ""
    var body: some View {
        Text(text)
            .foregroundColor(CustomColor.ColorBlack)
            .font(.customFont(size: 24,weight: .bold))
    }
}
struct SubTitleText: View {
    @State var text: String = ""
    var body: some View {
        Text(text)
            .foregroundColor(CustomColor.ColorBlack)
            .font(.customFont(size: 14, weight:.light))
    }
}
struct UnderlineTextField: View {
    @Binding var text: String
    var placeholder: String
    var imageName : String = ""
    var isSecure: Bool = false
    var isEyeDisplay: Bool = false
    @State var isEyeSecure: Bool = true
    var body: some View {
        VStack(alignment: .leading,spacing: 0) {
            HStack{
                if imageName != ""{
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15,height: 15)
                        .padding()
                        
                }
                if isSecure {
                    if isEyeSecure{
                        SecureField("", text: $text)
                            .placeholder(when: text.isEmpty) {
                                Text(placeholder).foregroundColor(CustomColor.ColorBlack)
                            }.foregroundColor(CustomColor.ColorBlack)
                            .font(.customFont(size: 14,weight:.light))
                            .padding(.vertical, 10)
                    }
                    else{
                        TextField("", text: $text)
                            .placeholder(when: text.isEmpty) {
                                Text(placeholder).foregroundColor(CustomColor.ColorBlack)
                            }.foregroundColor(CustomColor.ColorBlack)
                            .font(.customFont(size: 14,weight:.light))
                            .padding(.vertical, 10)
                    }
                    
                    
                    if isEyeDisplay{
                        Button(action: {
                            isEyeSecure.toggle()
                        }) {
                            Image(systemName: isEyeSecure ? "eye.slash" : "eye")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                else{
                    //                TextField(placeholder, text: $text)
                    //                    .foregroundColor(CustomColor.ColorBlack)
                    //                    .font(.customFont(size: 14))
                    //                    .padding(.vertical, 10)
                    
                    TextField("", text: $text)
                        .placeholder(when: text.isEmpty) {
                            Text(placeholder).foregroundColor(CustomColor.ColorBlack)
                        }.foregroundColor(CustomColor.ColorBlack)
                        .font(.customFont(size: 14,weight:.light))
                        .padding(.vertical, 10)
                }
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(CustomColor.ColorGreyD6D6D6)
        }
        .frame(height: 50)
    }
}

struct AllTextViewComponent_Previews: PreviewProvider {
    static var previews: some View {
        UnderlineTextField(text: .constant(""), placeholder: "Enter name",isSecure: true,isEyeDisplay: true)
//        UnderlineTextField(text: .constant(""), placeholder: "Enter name",imageName: ImageConstants.ic_email)
//        SubTitleText(text: "Test subtitle")
    }
}
