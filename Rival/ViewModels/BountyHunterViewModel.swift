//
//  BountyHunterViewModel.swift
//  Rival
//
//  Created by Desi Rorie on 8/8/23.
//



// Fix the scaling for the power of the dragon or the player
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
    var countOfItem = 1
}

struct HealthInventoryItem: InventoryItem {
    var id = UUID()
    var name: String
    var price: Int
    var healthBoost: Int
    var countOfItem = 1
}

protocol Villain{
    var name:String{get}
    var villainHealth: Int {get}
    var power:Int {get
    }
}

struct DragonKing: Villain {
    var name = "Dragon King"
    var villainHealth = 200
    var power = 25
    
    
    mutating func attackPlayer(in viewModel: BountyHunterViewModel) {
        let damage = min(power, viewModel.health)
        var randomNumber = Int.random(in: 0..<100)
        if randomNumber.isMultiple(of: 2){
            print("Dragon King attacked the player for \(damage) damage!")
            viewModel.receiveAttack(damage: damage)
        }else{
            viewModel.villainMissed = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                viewModel.villainMissed = false
            }
            print("Dragon Missed")
        }
        
        
       
    }
}

class BountyHunterViewModel: ObservableObject{
    init(){
        print("Game Model Started")
    }
    
    deinit{
        print("Game Model Closed")
    }
    var gameIsStarted: Bool =  false
    @Published var villainMissed: Bool = false
    @Published var playerTurn : Bool = true
    @Published var diceOutcome: Int = 0
    @Published var pathWasChosen: Bool = false
    @Published var needGoldAlertTriggered:Bool = false
    @Published var itemAlreadyEquippedAlertTriggered:Bool = false
    @Published var gold: Int = 200
    @Published var playerInventory: [WeaponInventoryItem] = []
    @Published var playerHealthInventory: [HealthInventoryItem] = []
    @Published var boughtItemAlert:Bool = false
    @Published var health: Int = 100
    @Published var handPower: Int = 5
    @Published var equippedItem: WeaponInventoryItem = WeaponInventoryItem(name: "Fist", price: 0, power: 5)
    @Published var dragon = DragonKing()
    
    var inventory: [WeaponInventoryItem] = [
        WeaponInventoryItem(name: "Mace", price: 45, power: 10),
        WeaponInventoryItem(name: "Axe", price: 55, power: 12),
        WeaponInventoryItem(name: "Kitana", price: 70, power: 20),
        
    ]
    var healthInventory: [HealthInventoryItem] = [HealthInventoryItem(name: "Apple", price: 25, healthBoost: 10),
                                                  HealthInventoryItem(name: "Soup", price: 50, healthBoost: 25)]
    func dragonAttack() {
        dragon.attackPlayer(in: self)
//        if !playerTurn {
//            dragon.attackPlayer(in: self) // Call Dragon's attackPlayer method
//        }
    }

   func receiveAttack(damage: Int) {
    
    health -= damage
        print(health)
    }
    
    func sellItem(item: any InventoryItem) {
        if let index = playerHealthInventory.firstIndex(where: { $0.id == item.id }) {
            if playerHealthInventory[index].countOfItem > 1 {
                playerHealthInventory[index].countOfItem -= 1
                gold += item.price
                print("Sold item and decreased the amount")
            } else {
                gold += item.price
                print("Removed the item from the inventory")
                playerHealthInventory.remove(at: index)
            }
        } else{
            if let index = playerInventory.firstIndex(where: {$0.id == item.id}){
                if playerInventory[index].countOfItem > 1 {
                    playerInventory[index].countOfItem -= 1
                    gold += item.price
                    print("Sold item and decreased the amount")
                } else {
                    gold += item.price
                    print("Removed the item from the inventory")
                    playerInventory.remove(at: index)
                }
            }
        }
    }
    
    func useHealthItem(item:HealthInventoryItem){
        if let index = playerHealthInventory.firstIndex(where: {$0.id == item.id}){
            if playerHealthInventory[index].countOfItem > 1 {
                playerHealthInventory[index].countOfItem -= 1
                health += item.healthBoost
                print("item used. Health is now \(health) ")
            }
            else {
                health += item.healthBoost
                playerHealthInventory.remove(at: index)
                print("item used. Health is now \(health) ")
            }
        }
    }
    func rollDice(){
        let num1 = Int.random(in: 1..<6)
        let num2 = Int.random(in: 1..<6)
        diceOutcome =  num1 + num2
        
    }
    
    func purchaseItem(item:WeaponInventoryItem){
        if (gold >= item.price && !playerInventory.contains(item)){
            gold -= item.price
            print("\(gold)")
            playerInventory.append(item)
            print(playerInventory)
            boughtItemAlert = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                self.boughtItemAlert = false
            }
        }
        else if (gold > item.price && playerInventory.contains(item)){
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
