//
//  DragonScreen.swift
//  Rival
//
//  Created by Desi Rorie on 8/11/23.
//

import SwiftUI

struct DragonScreen: View {
    @ObservedObject var viewModel: BountyHunterViewModel
    
    
    var body: some View {
        ZStack {
            Color.black
            VStack{
                HStack {
                    Text("DRAGON").foregroundColor(.red)          .font(.custom("PressStart2P-Regular", size: 25))
                        .offset(y: 50)
                }
                Spacer().frame(height: 50)
                HStack {
                    Text("Health - \(viewModel.dragon.villainHealth)")          .font(.custom("PressStart2P-Regular", size: 15))
                        .foregroundColor(.red)
                }
                HStack {
                    ZStack {
                        Rectangle().fill(.red)
                            .frame(width: 200, height: 10)
                        Rectangle().fill(.green)
                            .frame(width: CGFloat(viewModel.dragon.villainHealth), height: 10)
                    }
                }
                Spacer()
                
                
                VStack(spacing: 10) {
                    ZStack {RoundedRectangle(cornerRadius: 25)
                            .fill(Color("CallToActionColor"))
                            .frame(width: 120,height: 50)
                            
                        Button {
                            if viewModel.playerTurn{
                                if (viewModel.dragon.villainHealth - viewModel.equippedItem.power < 0 ){
                                    viewModel.dragon.villainHealth = 0
                                    viewModel.playerTurn = false
                                }else{
                                    viewModel.dragon.villainHealth -= viewModel.equippedItem.power
                                    viewModel.playerTurn = false
                                }
                            } else{
                                viewModel.dragonAttack()
                                viewModel.playerTurn = true
                            }
                            
                            
                            
                        } label: {
                            Text("Attack")
                                .font(.custom("PressStart2P-Regular", size: 15))
                    }
                    }
                    Spacer().frame(height: 20)
                    HStack{
                        Text("Player Health").foregroundColor(.white)
                            .font(.custom("PressStart2P-Regular", size: 15))
                    }
                    HStack {
                        Text("Health - \(viewModel.health)").font(.custom("PressStart2P-Regular", size: 15))
                            .foregroundColor(.green)
                    }
                    HStack {
                        ZStack {
                            Rectangle().fill(.red)
                                .frame(width: 100, height: 10)
                            Rectangle().fill(.green)
                                .frame(width: CGFloat(viewModel.health), height: 10)
                        }
                    }
                }
                Spacer().frame(height: 100)
                
                
            }
        }.ignoresSafeArea()
            .onAppear{
                print(viewModel.dragon.villainHealth)
            }
    }
}

struct DragonScreen_Previews: PreviewProvider {
    static var previews: some View {
        DragonScreen(viewModel: BountyHunterViewModel())
    }
}
