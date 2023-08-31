//
//  OnboardingListScreenView.swift
//  Fluxstore
//
//  Created by Microloop Bhumi on 8/28/23.
//

import SwiftUI
import ACarousel
struct onBoardingListItem: Identifiable {
    let id = UUID()
    let title: String
    let subTitle: String
    let image: String
}

struct OnboardingListScreenView: View {
    @State var index: Int = 0
    let arrData : [onBoardingListItem] = [
        onBoardingListItem(title: "Discover something new", subTitle: "Special new arrival just for you", image: ImageConstants.ic_onboarding1),
        onBoardingListItem(title: "Update trendy outfit", subTitle: "Favourite brand and latest trends", image: ImageConstants.ic_onboarding2),
        onBoardingListItem(title: "Explore your true style", subTitle: "Relax and let us bring the style to you", image: ImageConstants.ic_onboarding3)
    ]
    
    var body: some View {
        NavigationView{
            GeometryReader { geo in
                ZStack{
                    VStack{
                        Rectangle().fill(CustomColor.ColorWhite)
                        Rectangle().fill(CustomColor.ColorBlack464447)
                    }
                    VStack{
                        VStack(spacing: 20){
                            Text(self.arrData[self.index].title).foregroundColor(CustomColor.ColorBlack)
                                .font(.customFont(size: 20, weight: .bold))
                            Text(self.arrData[self.index].subTitle).foregroundColor(CustomColor.ColorBlack)
                                .font(.customFont(size: 14))
                            
                        }.padding(.bottom,30)
                        ACarousel(self.arrData,
                                  index:$index,
                                  spacing: 20,
                                  headspace: 20,
                                  sidesScaling: 0.7) { item in
                            
                            VStack {
                                HStack{
                                    Spacer()
                                    Image(item.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    Spacer()
                                }.padding()
                                    .background(CustomColor.ColorGreyE7E8E9)
                                    .cornerRadius(10)
                            }
                        }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        HStack {
                            ForEach(0..<self.arrData.count, id: \.self) { idx in
                                Circle().frame(width: 8)
                                    .foregroundColor(idx == self.index ? CustomColor.ColorWhite : .clear)
                                    .cornerRadius(4)
                                    .overlay(RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.white, lineWidth: 1))
                                    .onTapGesture {
                                        self.index = idx
                                    }
                            }
                        }.padding(.top,50)
                        
                        NavigationLink {
                            SignUpScreenView()
                        } label: {
                            CommonButtonView(text: "Shopping now").padding(.horizontal,geo.size.width * 0.2)
                                .padding(.top,20)
                        }
                        
                        
                    }.padding(.vertical,geo.size.width * 0.25)
                }
            }.edgesIgnoringSafeArea(.all)
        }.navigationBarHidden(true)
    }
}
struct OnboardingListScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingListScreenView(index: 0)
    }
}
