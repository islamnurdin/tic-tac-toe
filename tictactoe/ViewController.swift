//
//  ViewController.swift
//  tictactoe
//
//  Created by MacBook Pro on 12/19/17.
//  Copyright © 2017 Islam & Co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activeGame = true
    
    var activePlayer = 1
    
    var gameState = [0,0,0,0,0,0,0,0,0] //0 - empty, 1 - noughts, 2 - crosses
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [2,5,8], [1,4,7], [0,3,6], [0,4,8], [2,4,6]]
    
    @IBOutlet var winnerLabel: UILabel!

    @IBOutlet var playAgainLabel: UIButton!

    @IBAction func playAgain(_ sender: AnyObject) {
        
        activeGame = true
        
        activePlayer = 1
        
        gameState = [0,0,0,0,0,0,0,0,0]
        
        for i in 1...9{
            
            if let button = view.viewWithTag(i) as? UIButton{
                
                button.setImage(nil, for: [])
            }
            
            winnerLabel.isHidden = true
            playAgainLabel.isHidden = true
            
            winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
            playAgainLabel.center = CGPoint(x: playAgainLabel.center.x - 500, y: playAgainLabel.center.y)
            
        }
        
        
    }
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame{
     
            gameState[activePosition] = activePlayer
        
            if(activePlayer == 1){
                sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
            } else{
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
            }
            
            for combination in winningCombinations{
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                    
                    //winner!
                    

                    activeGame = false

                    winnerLabel.isHidden = false
                    playAgainLabel.isHidden = false
                    
                    if gameState[combination[0]] == 1{
                        
                        winnerLabel.text = "Noughts has won!"
                    } else{
                        
                        winnerLabel.text = "Cross has won!"
                    }
                    
                    UIView.animate(withDuration: 1){
                        
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        
                        self.playAgainLabel.center = CGPoint(x: self.playAgainLabel.center.x + 500, y: self.playAgainLabel.center.y)
                    }
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        winnerLabel.isHidden = true
        playAgainLabel.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainLabel.center = CGPoint(x: playAgainLabel.center.x - 500, y: playAgainLabel.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

