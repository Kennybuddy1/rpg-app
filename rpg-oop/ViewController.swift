//
//  ViewController.swift
//  rpg-oop
//
//  Created by Kabir arora on 6/29/16.
//  Copyright © 2016 Kabir Arora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var playerHpLbl: UILabel!
    @IBOutlet weak var enemyHpLbl: UILabel!
    @IBOutlet weak var enemyImage: UIImageView!
    @IBOutlet weak var chestBtn: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "DirtyLaundry21", hp: 110, attackPwr: 20)
        
        playerHpLbl.text = "\(player.hp) HP"
    }

    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 12)
        }else{
            enemy = DevilWizard(startingHp: 60, attackPwr: 15)
        }
        enemyImage.isHidden = false
    }
    
    
    
    @IBAction func onChestTapped(sender: AnyObject){
        chestBtn.isHidden = true
        printLbl.text = chestMessage
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(ViewController.generateRandomEnemy), userInfo: nil, repeats: false)
        
    }
    @IBAction func attackTapped(_ sender: AnyObject) {
       
        if enemy.attemptAttack(attackPwr: player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) Hp"
            enemyHpLbl.text = "\(enemy.hp) HP"
        }else{
            printLbl.text = "Attack Failed"
        }
        
        
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(item: loot)
            chestMessage = "\(player.name) found \(loot)"
            chestBtn.isHidden = false
            
        }
        
        if !enemy.isAlive {
            enemyHpLbl.text = ""
            printLbl.text = "Killed \(enemy.type)"
            enemyImage.isHidden = true
        }
        
    }
}


