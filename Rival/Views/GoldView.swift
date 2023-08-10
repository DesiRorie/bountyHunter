//
//  GoldView.swift
//  Rival
//
//  Created by Desi Rorie on 8/8/23.
//

import SwiftUI

struct GoldView: View {
    @ObservedObject var viewModel: BountyHunterViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color("MainColor")
            VStack{
                HStack{
                    Image(systemName: "xmark")
                        .font(.custom("PressStart2P-Regular", size: 30))
                        .onTapGesture {
                            dismiss()
                        }
                        .offset(x:25,y:50)

                    Spacer()
                }
                HStack {
                    Text("GOLD")
                        .font(.custom("PressStart2P-Regular", size: 30))
                    
                        .foregroundColor(Color("CallToActionColor"))
                    .offset(y:50)
                }
                Spacer()
                VStack{
                    Text("You have \(viewModel.gold) gold remaining")
                        .font(.custom("PressStart2P-Regular", size: 25))
                        .multilineTextAlignment(.center)
                          
                }
                Spacer()
            }
        }
    }
}

struct GoldView_Previews: PreviewProvider {
    static var previews: some View {
        GoldView(viewModel: BountyHunterViewModel())
    }
}
