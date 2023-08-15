//
//  DragonScreen.swift
//  Rival
//
//  Created by Desi Rorie on 8/11/23.
//

import SwiftUI

struct DragonScreen: View {
    @ObservedObject var viewModel: BountyHunterViewModel
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        ZStack {
            Color.black
            VStack{
                VStack{
                    Spacer().frame(height: 70)
                    HStack{
                        Button {
                            dismiss()
                        } label: {
                            Text("BACK").foregroundColor(.white)
                                .font(.custom("PressStart2P-Regular", size: 15))
                        }

                      
                        Spacer().frame(width: 320)
                    }
                }
                
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
             
                Image("dragonKing")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .offset(y:-20)
//                Spacer()
                HStack{
                    viewModel.villainMissed ? Text("Dragon Missed!").foregroundColor(.white) : Text("")
                }.frame(height: 20)
                    .font(.custom("PressStart2P-Regular", size: 15))
                    .foregroundColor(.white)
                    .padding(.vertical)
                
                VStack(spacing: 10) {
                    ZStack {RoundedRectangle(cornerRadius: 25)
                            .fill(Color("CallToActionColor"))
                            .frame(width: 120,height: 50)
                            
                        Button {
                            if viewModel.playerTurn{
                                if (viewModel.dragon.villainHealth - viewModel.equippedItem.power < 0 ){
                                    viewModel.dragon.villainHealth = 0
//                                    viewModel.playerTurn = false
                                }else{
                                    viewModel.dragon.villainHealth -= viewModel.equippedItem.power
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                        
                                        viewModel.dragonAttack()
                                    }
//                                    viewModel.playerTurn = false
                                }
                            } else{
//                                viewModel.dragonAttack()
//                                viewModel.playerTurn = true
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
                Spacer().frame(height: 40)
                
                
            }
        }.ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
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
