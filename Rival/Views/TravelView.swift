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
                HStack {
                    Text("PLAYER")
                        .font(.custom("PressStart2P-Regular", size: 30))
                        
                    
                        .foregroundColor(Color("CallToActionColor"))
                    .offset(y:50)
                }
                Spacer()
                VStack(alignment: .leading,spacing: 50){
                    VStack(alignment: .leading,spacing: 50) {
                        HStack{
                            Text("Equipped Weapon - \(viewModel.equippedItem.name)").foregroundColor(.white).font(.custom("PressStart2P-Regular", size: 15))
                        }
                        HStack{
                            Text("Power - \(viewModel.equippedItem.power)").foregroundColor(.white).font(.custom("PressStart2P-Regular", size: 15))
                        }
                    }
                    VStack(alignment: .leading,spacing: 55){
                        HStack{
                           Text("Health - ").foregroundColor(.white).font(.custom("PressStart2P-Regular", size: 15))
                            Text("\(viewModel.health)").foregroundColor(.white).font(.custom("PressStart2P-Regular", size: 15))
                        }
                        HStack{
                            Text("Fist Strength - \(viewModel.handPower)").foregroundColor(.white).font(.custom("PressStart2P-Regular", size: 15))
                            Spacer()
                        }
                    }
                }.padding()
                
                Spacer()
            }
           }.edgesIgnoringSafeArea(.all)
    }
}

struct TravelView_Previews: PreviewProvider {
    static var previews: some View {
        TravelView(viewModel: BountyHunterViewModel())
    }
}
