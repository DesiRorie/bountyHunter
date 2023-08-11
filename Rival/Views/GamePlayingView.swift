//
//  GamePlayingView.swift
//  Rival
//
//  Created by Desi Rorie on 8/10/23.
//

import SwiftUI

struct GamePlayingView: View {
    @ObservedObject var viewModel = BountyHunterViewModel()
    var dragonKing = DragonKing()
    var body: some View {
        VStack{
            Spacer()
            
            Button {
              viewModel.rollDice()
                
                viewModel.receiveAttack(damage: dragonKing.power)
            } label: {
                Text("ROLL DICE")
                    .foregroundColor(.white).bold()
                    .font(.custom("PressStart2P-Regular", size: 20))
            }
            if (viewModel.diceOutcome > 0) {
                Text("Your number is \(viewModel.diceOutcome)").foregroundColor(.red)
            }

            Spacer()
        }.frame(width: 400, height: 600)
            .background(.black)
    }
}

struct GamePlayingView_Previews: PreviewProvider {
    static var previews: some View {
        GamePlayingView()
    }
}