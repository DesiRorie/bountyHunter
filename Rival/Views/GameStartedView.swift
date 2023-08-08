//
//  GameStartedView.swift
//  Rival
//
//  Created by Desi Rorie on 8/7/23.
//

import SwiftUI

struct GameStartedView: View {
    @State var pathChosen:Bool = false
    var body: some View {
        
            VStack{
                VStack{
                    Text("Welcome to Bounty Hunter") .font(.title2)
                    Text("Which path would you like to take?") .font(.title3)
                }
                .padding()
                .foregroundColor(.white)
                Spacer()
                VStack{
                    if pathChosen {
                        Text("Chosen")
                    }
                    
                    Button("Dragon King") {
                        pathChosen = true
                    }
                    .frame(minWidth: 200)
                    .padding()
                    .background(Color("CallToActionColor"))
                    .cornerRadius(25)
                    
                    Button("Android 115") {
                        
                    }
                    .frame(minWidth: 200)
                    .padding()
                    .background(Color("CallToActionColor"))
                    .cornerRadius(25)
                    
                    Button("Cowboy X") {
                        
                    }
                    .frame(minWidth: 200)
                    .padding()
                    .background(Color("CallToActionColor"))
                    .cornerRadius(25)
                }.bold()
                    .foregroundColor(.black)
                Spacer()
            
        }
    }
}

struct GameStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GameStartedView()
    }
}
