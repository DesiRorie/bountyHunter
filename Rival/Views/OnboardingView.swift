//
//  OnboardingView.swift
//  Rival
//
//  Created by Desi Rorie on 8/7/23.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("MainColor")
                VStack{
                    
                    VStack{
                        Text("Bounty Hunter")
                            .foregroundColor(Color("CallToActionColor"))
                            .font(.custom("PressStart2P-Regular", size: 30))
                            .offset(y:20)
                            
                            .bold()
                    }
                    Spacer()
                    
                    VStack{
                        GameDisplayView()
                    }
                    Spacer().frame(height: 150)
                }
                .navigationBarBackButtonHidden(true)
                .offset(y:50)
                
            }.ignoresSafeArea(.all)
            
            
        }

    }
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
