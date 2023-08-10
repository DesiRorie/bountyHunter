//
//  GameDisplayView.swift
//  Rival
//
//  Created by Desi Rorie on 8/7/23.
//

import SwiftUI

struct GameDisplayView: View {
    @State var clickToPlayIsNotShowing:Bool = false
    @State var isScaling:Bool = false
    @State var gameIsStarted:Bool = false
    var body: some View {
        ZStack{
            Color("DisplayColor")
            VStack{
                if !clickToPlayIsNotShowing{
                    Text("Start Game")
                        .bold()
                        .font(.custom("PressStart2P-Regular", size: 15))
                        .foregroundColor(.white)
                        .scaleEffect(isScaling ? 1.5 : 1)
                        .onTapGesture {
                            withAnimation {
                                clickToPlayIsNotShowing = true
                            }
                        
                    }
                        .onAppear{
                        isScaling = true
                        }
                        .animation(Animation.easeInOut(duration: 2.5).repeatForever(), value: isScaling)
                } else{
                    GameStartedView()
                        .opacity(gameIsStarted ? 1 : 0)
                        .animation(.easeOut(duration: 1), value: gameIsStarted)
                        .onAppear{
                            withAnimation {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                    gameIsStarted = true
                                }
                                
                            }
                            
                        }
                        
                        
                }
                
            }
        }.ignoresSafeArea(.all)
            .frame(width: 400, height: 450)
            .cornerRadius(25)
    }
}

struct GameDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        GameDisplayView()
    }
}
