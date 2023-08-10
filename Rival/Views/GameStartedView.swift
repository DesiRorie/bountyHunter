//
//  GameStartedView.swift
//  Rival
//
//  Created by Desi Rorie on 8/7/23.
//

import SwiftUI

struct GameStartedView: View {
    @StateObject var viewModel = BountyHunterViewModel()
    var body: some View {
        VStack{
            if viewModel.pathWasChosen{
                VStack{
                    NavbarView(viewModel: viewModel).foregroundColor(.white)
                    Spacer().frame(height: 400)
                }
            
        }
        else{
            VStack{
                VStack{
                    Text("Welcome to Bounty Hunter") .font(.custom("PressStart2P-Regular", size: 15))
                    Spacer().frame(height: 10)
                    Text("Choose Your Path") .font(.custom("PressStart2P-Regular", size: 12.5))
                }
                .padding()
                .foregroundColor(.white)
                Spacer()
                VStack{
                    if viewModel.pathWasChosen {
                        Text("Chosen")
                    }
                    
                    Button("Dragon King") {
                        viewModel.pathWasChosen = true
                        viewModel.chosenPath = 1
                    }.font(.custom("PressStart2P-Regular", size: 15))
                    .frame(minWidth: 200)
                    .padding()
                    .background(Color("CallToActionColor"))
                    .cornerRadius(25)
                    
                    Button("Android 115") {
                        viewModel.pathWasChosen = true
                        viewModel.chosenPath = 2
                    }.font(.custom("PressStart2P-Regular", size: 15))
                    .frame(minWidth: 200)
                    .padding()
                    .background(Color("CallToActionColor"))
                    .cornerRadius(25)
                    
                    Button("Cowboy X") {
                        viewModel.pathWasChosen = true
                        viewModel.chosenPath = 3
                    }.font(.custom("PressStart2P-Regular", size: 15))
                    .frame(minWidth: 200)
                    .padding()
                    .background(Color("CallToActionColor"))
                    .cornerRadius(25)
                }.bold()
                    .foregroundColor(.black)
                Spacer()
            }
            }
        }.onChange(of: viewModel.pathWasChosen) { newValue in
            print("changed")
        }
    }
}

struct GameStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GameStartedView()
    }
}
