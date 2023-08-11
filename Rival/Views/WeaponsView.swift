//
//  WeaponsView.swift
//  Rival
//
//  Created by Desi Rorie on 8/8/23.
//

import SwiftUI

struct WeaponsView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: BountyHunterViewModel
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
                Text("BAG")
                    .font(.custom("PressStart2P-Regular", size: 30))
                
                    .foregroundColor(Color("CallToActionColor"))
                    .offset(y:50)
                Spacer()
                VStack(spacing: 20){
                    Text("WEAPONS").font(.custom("PressStart2P-Regular", size: 30))  .foregroundColor(.white)
                    if (viewModel.playerInventory.isEmpty){
                        Text("You have no weapons.").font(.custom("PressStart2P-Regular", size: 15))  .foregroundColor(.white)
                    }else{
                        ForEach(viewModel.playerInventory, id: \.id) { item in
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Item - \(item.name)")
                                }
                                Spacer().frame(height: 10)
                                HStack {
                                    Text("Power - \(item.power)")
                                }
                                
                                Button {
                                    viewModel.sellItem(item: item)
                                } label: {
                                    Text("SELL")
                                }.padding(.vertical)
                                
                            }.padding()
                                .background(Color("DisplayColor"))
                                .foregroundColor(.white)
                                .font(.custom("PressStart2P-Regular", size: 15))
                            
                        }
                    }
                }
                Spacer()
                    .frame(height: 250)
                VStack(spacing: 20){
                    Text("HEALTH").font(.custom("PressStart2P-Regular", size: 30))  .foregroundColor(.white)
                    if (viewModel.playerHealthInventory.isEmpty){
                        Text("You have no health items.").font(.custom("PressStart2P-Regular", size: 15))  .foregroundColor(.white)
                    }else{
                        ForEach(viewModel.playerHealthInventory, id: \.id) { item in
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Item - \(item.name)")
                                }
                                Spacer().frame(height: 10)
                                HStack {
                                    Text("Boost - \(item.healthBoost)")
                                }
                                Spacer().frame(height: 10)
                                VStack(spacing: 10){
                                    HStack {
                                        Text("Amount - \(item.countOfItem)")
                                    }
                                    VStack{
                                        Spacer().frame(height: 10)
                                        Button {
                                            viewModel.sellItem(item: item)
                                        } label: {
                                            Text("SELL").foregroundColor(.red )
                                                
                                        }
                                        Spacer().frame(height: 20)
                                        Button {
                                            viewModel.useHealthItem(item: item)
                                        } label: {
                                            Text("USE").foregroundColor(Color("CallToActionColor"))
                                        }
                                        Spacer().frame(height: 10)
                                    }
                                }
                                Spacer().frame(height: 10)
                             
                                

                            }.padding()
                                .background(Color("DisplayColor"))
                                .foregroundColor(.white)
                                .font(.custom("PressStart2P-Regular", size: 15))
                            
                        }
                    }
                }
                Spacer()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct WeaponsView_Previews: PreviewProvider {
    static var previews: some View {
        WeaponsView(viewModel: BountyHunterViewModel())
    }
}
