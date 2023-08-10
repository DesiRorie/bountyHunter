//
//  TravelView.swift
//  Rival
//
//  Created by Desi Rorie on 8/8/23.
//

import SwiftUI

struct TravelView: View {
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
                Text("TRAVEL")
                    .font(.custom("PressStart2P-Regular", size: 30))
                
                    .foregroundColor(Color("CallToActionColor"))
                    .offset(y:50)
                Spacer()
            }
        }
    }
}

struct TravelView_Previews: PreviewProvider {
    static var previews: some View {
        TravelView(viewModel: BountyHunterViewModel())
    }
}
