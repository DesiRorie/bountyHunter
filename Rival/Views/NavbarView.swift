//
//  NavBar.swift
//  Rival
//
//  Created by Desi Rorie on 8/8/23.
//

import SwiftUI

struct NavbarView: View {
    @ObservedObject var viewModel: BountyHunterViewModel
    @State private var isShopSheetPresented = false
    @State private var isWeaponsSheetPresented = false
    @State private var isGoldSheetPresented = false
    @State private var isTravelSheetPresented = false
    var body: some View {
        HStack(spacing:20){
            Button("SHOP") {
                isShopSheetPresented = true
            }
            Button("BAG") {
                isWeaponsSheetPresented = true
            }
            Button("GOLD") {
                isGoldSheetPresented = true
            }

            Button("TRAVEL") {
                isTravelSheetPresented = true
            }


            
        }.font(.custom("PressStart2P-Regular", size: 15))
            .frame(height: 150)
            .fullScreenCover(isPresented: $isShopSheetPresented) {
                ShopView(viewModel: viewModel).edgesIgnoringSafeArea(.all)
            }
            .fullScreenCover(isPresented: $isWeaponsSheetPresented) {
                WeaponsView(viewModel: viewModel).edgesIgnoringSafeArea(.all)
            }
            .fullScreenCover(isPresented: $isGoldSheetPresented) {
                GoldView(viewModel: viewModel).edgesIgnoringSafeArea(.all)
            }
            .fullScreenCover(isPresented: $isTravelSheetPresented) {
                TravelView(viewModel:viewModel).edgesIgnoringSafeArea(.all)
            }    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavbarView(viewModel: BountyHunterViewModel())
    }
}
