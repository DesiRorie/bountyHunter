//
//  BountyHunterViewModel.swift
//  Rival
//
//  Created by Desi Rorie on 8/8/23.
//

import Foundation

class BountyHunterViewModel: ObservableObject{
    var gameIsStarted: Bool =  false
    var pathWasChosen: Bool = false
    
    var gold: Int = 0
    var health: Int = 100
    var inventory : [String] = []
    
    func travel() {
        
    }
    
    
    
}
