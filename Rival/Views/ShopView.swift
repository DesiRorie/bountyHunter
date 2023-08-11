//
//  ShopView.swift
//  Rival
//
//  Created by Desi Rorie on 8/8/23.
//

import SwiftUI
//TabView for different type of objects?
struct ShopView: View {
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
                VStack {
                    Text("SHOP")
                        .font(.custom("PressStart2P-Regular", size: 30))
                    
                        .foregroundColor(Color("CallToActionColor"))
                        .offset(y:50)
                    
                }
                Spacer().frame(height: 100)
                VStack {
                    HStack{
                        //                        Spacer()
                        Text("Gold Remaining - \(viewModel.gold)").padding()
                            .font(.custom("PressStart2P-Regular", size: 10))
                        
                    }
                    Text("Weapons")
                    ScrollView {
                        LazyVGrid(columns: [
                            GridItem(.flexible(minimum: 100, maximum: 250), spacing: 16),
                            GridItem(.flexible(minimum: 100, maximum: 250), spacing: 16)
                            
                        ], spacing: 16) {
                            ForEach(viewModel.inventory, id: \.name) { item in
                                VStack(alignment: .leading,spacing: 10) {
                                    Text(item.name)
                                    Text("Price: \(item.price)")
                                    Text("Power: \(item.power)")
                                    HStack {
                                        Spacer()
                                        Button {
                                            viewModel.purchaseItem(item: item)
                                        } label: {
                                            Text("Buy").foregroundColor(Color("CallToActionColor"))
                                        }
                                        Spacer()
                                    }
                                    
                                }
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                            }
                        }
                        .padding()
                        
                    }
                    
             
                    if(viewModel.itemAlreadyEquippedAlertTriggered){
                        Text("Cannot purchase item that is already equipped.")
                            .multilineTextAlignment(.center)
                            .font(.custom("PressStart2P-Regular", size: 14))
                            .foregroundColor(.red)
                    }
                    Spacer().frame(height: 20)
                } .foregroundColor(.white)
                    .font(.custom("PressStart2P-Regular", size: 13))
                VStack{
                    Text("Health Items")
                    ScrollView{
                        ScrollView {
                            LazyVGrid(columns: [
                                GridItem(.flexible(minimum: 100, maximum: 250), spacing: 16),
                                GridItem(.flexible(minimum: 100, maximum: 250), spacing: 16)
                                
                            ], spacing: 16) {
                                ForEach(viewModel.healthInventory, id: \.name) { item in
                                    VStack(alignment: .leading,spacing: 10) {
                                        Text(item.name)
                                        Text("Price: \(item.price)")
                                        Text("Power: \(item.healthBoost)")
                                        HStack {
                                            Spacer()
                                            Button {
                                                viewModel.purchaseHealthItem(item: item)
                                            } label: {
                                                Text("Buy").foregroundColor(Color("CallToActionColor"))
                                            }
                                            Spacer()

                                           
                                            
                                        }
                                        
                                    }
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                                }
                            }
                            .padding()
                            
                        }
                    }
                    if(viewModel.needGoldAlertTriggered){
                        Text("Not enough gold.") .font(.custom("PressStart2P-Regular", size: 15))
                            .foregroundColor(.red)
                        Spacer().frame(height: 100)
                    }
                    if(viewModel.boughtItemAlert){
                        Text("Bought").foregroundColor(.green)
                        Spacer().frame(height: 100)
                    }
                    
                }.foregroundColor(.white)
                    .font(.custom("PressStart2P-Regular", size: 13))
            }
            
        }.ignoresSafeArea()
    }
}


struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView(viewModel: BountyHunterViewModel())
    }
}
