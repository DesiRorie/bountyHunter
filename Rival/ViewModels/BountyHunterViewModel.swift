//
//  BountyHunterViewModel.swift
//  Rival
//
//  Created by Desi Rorie on 8/8/23.
//

import Foundation
protocol InventoryItem: Hashable {
    var name: String { get }
    var price: Int { get }
    var id: UUID { get}
}

struct WeaponInventoryItem: InventoryItem {
    var name: String
    var id = UUID()
    var price: Int
    var power: Int
}

struct HealthInventoryItem: InventoryItem {
    var id = UUID()
    var name: String
    var price: Int
    var healthBoost: Int
    var countOfItem = 1
}

// for the add or sell function alter the amount of the health 

//
//struct WeaponInventoryItem: Hashable{
//    var name: String
//    var price: Int
//    var power: Int
//}
//struct HealthInventoryItem: Hashable{
//    var name: String
//    var price: Int
//    var healthBoost: Int
//}
class BountyHunterViewModel: ObservableObject{
    init(){
        print("Game Model Started")
    }
    
    deinit{
        print("Game Model Closed")
    }
    var gameIsStarted: Bool =  false
    @Published var pathWasChosen: Bool = false
    @Published var needGoldAlertTriggered:Bool = false
    @Published var itemAlreadyEquippedAlertTriggered:Bool = false
   @Published var gold: Int = 100
    var health: Int = 100
    var inventory: [WeaponInventoryItem] = [
        WeaponInventoryItem(name: "Mace", price: 45, power: 10),
        WeaponInventoryItem(name: "Axe", price: 55, power: 12),
        WeaponInventoryItem(name: "Kitana", price: 70, power: 20),

    ]
    var healthInventory: [HealthInventoryItem] = [HealthInventoryItem(name: "Apple", price: 25, healthBoost: 10), HealthInventoryItem(name: "Chicken Soup", price: 50, healthBoost: 25)]
    var playerInventory: [WeaponInventoryItem] = []
    var playerHealthInventory: [HealthInventoryItem] = []
   @Published var boughtItemAlert:Bool = false
  
    
    func sellItem(item: any InventoryItem){
        if playerInventory.contains(where: { $0.id == item.id }) {
            if let index = playerInventory.firstIndex(where: { $0.id == item.id }) {
                 gold += item.price
                 playerInventory.remove(at: index)
             }
        } else if playerHealthInventory.contains(where: { $0.id == item.id }) {
            if let index = playerHealthInventory.firstIndex(where: { $0.id == item.id }) {
                 gold += item.price
                 playerHealthInventory.remove(at: index)
             }
         }
    }

    func purchaseItem(item:WeaponInventoryItem){
        if (gold > item.price && !playerInventory.contains(item)){
            gold -= item.price
            playerInventory.append(item)
            print(playerInventory)
            boughtItemAlert = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                self.boughtItemAlert = false
            }
        } else if (gold > item.price && playerInventory.contains(item)){
            itemAlreadyEquippedAlertTriggered = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                self.itemAlreadyEquippedAlertTriggered = false
            }
            print("Cannot purchase item that is already equiped.")
        }
      else  {
            needGoldAlertTriggered = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                self.needGoldAlertTriggered = false
            }
            print("Need More Gold")
        }
    }
    
    
//    func purchaseHealthItem(item:HealthInventoryItem){
//        if (gold > item.price && !playerHealthInventory.contains(item)){
//            gold -= item.price
//            item.countOfItem += 1
//            playerHealthInventory.append(item)
//            print(playerHealthInventory)
//            boughtItemAlert = true
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
//                self.boughtItemAlert = false
//            }
//        }
//        else if let existingItemIndex = playerHealthInventory.firstIndex(where: { $0.id == item.id }) {
//            if (gold >= item.price) {
//                gold -= item.price
//                playerHealthInventory[existingItemIndex].countOfItem += 1
//                print("\(playerHealthInventory[existingItemIndex].countOfItem) in bag")
//            }
//        }
//      else  {
//            needGoldAlertTriggered = true
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
//                self.needGoldAlertTriggered = false
//            }
//            print("Need More Gold")
//        }
//    }
    func purchaseHealthItem(item: HealthInventoryItem) {
        if gold >= item.price {
            if let existingItemIndex = playerHealthInventory.firstIndex(where: { $0.id == item.id }) {
                gold -= item.price
                playerHealthInventory[existingItemIndex].countOfItem += 1
                print("\(playerHealthInventory[existingItemIndex].countOfItem) in bag")
            } else {
                gold -= item.price
                let newItem = HealthInventoryItem(id: item.id, name: item.name, price: item.price, healthBoost: item.healthBoost, countOfItem: 1)
                playerHealthInventory.append(newItem)
                print(playerHealthInventory)
                boughtItemAlert = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                    self.boughtItemAlert = false
                }
            }
        } else {
            needGoldAlertTriggered = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                self.needGoldAlertTriggered = false
            }
            print("Need More Gold")
        }
    }

    
    @Published var chosenPath: Int = 0
    
    
}
