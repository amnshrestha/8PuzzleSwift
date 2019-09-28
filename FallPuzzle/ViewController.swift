//
//  ViewController.swift
//  FallPuzzle
//
//  Created by Aman Shrestha on 9/27/19.
//  Copyright © 2019 Aman Shrestha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var puzzleObject = Puzzle()
    var imagesHere = [UIImage]()
    
    @IBOutlet weak var imageButton1: UIButton!
    @IBOutlet weak var imageButton2: UIButton!
    @IBOutlet weak var imageButton3: UIButton!
    @IBOutlet weak var imageButton4: UIButton!
    @IBOutlet weak var imageButton5: UIButton!
    @IBOutlet weak var imageButton6: UIButton!
    @IBOutlet weak var imageButton7: UIButton!
    @IBOutlet weak var imageButton8: UIButton!
    @IBOutlet weak var imageButton9: UIButton!
    
    
    @IBOutlet weak var congratsMessage: UILabel!
    @IBAction func swipedRight(_ sender: Any) {
        restartFunction()
    }
    
    @IBAction func restartFunction() {
        
        imageButton1.tag = 1
        imageButton1.setImage(UIImage(named: "Image1"), for: .normal)
        imageButton2.tag = 2
        imageButton2.setImage(UIImage(named: "Image2"), for: .normal)
        imageButton3.tag = 3
        imageButton3.setImage(UIImage(named: "Image3"), for: .normal)
        imageButton4.tag = 4
        imageButton4.setImage(UIImage(named: "Image4"), for: .normal)
        imageButton5.tag = 5
        imageButton5.setImage(UIImage(named: "Image5"), for: .normal)
        imageButton6.tag = 6
        imageButton6.setImage(UIImage(named: "Image6"), for: .normal)
        imageButton7.tag = 7
        imageButton7.setImage(UIImage(named: "Image7"), for: .normal)
        imageButton8.tag = 8
        imageButton8.setImage(UIImage(named: "Image8"), for: .normal)
        imageButton9.tag = 9
        imageButton9.setImage(UIImage(named: "Image9"), for: .normal)

        viewDidLoad()
        
    }
    
    @IBAction func button1(_ sender: UIButton) {
        
        
        //Change the array every time the button has been pressed
        
        var movePossible = false
        
        movePossible = puzzleObject.checkIfMovementPossible(tag: sender.tag)
        
        let emptyButton = self.view.viewWithTag(9) as? UIButton
        
        var buttonImage:UIImage
        var emptyButtonImage:UIImage

        var temp: Int
        if(movePossible){
            buttonImage = sender.imageView!.image!
            emptyButtonImage = (emptyButton?.imageView!.image!)!
            
            
            sender.setImage(emptyButtonImage, for: .normal)
            emptyButton?.setImage(buttonImage, for: .normal)
            
            temp = sender.tag
            sender.tag = emptyButton!.tag
            emptyButton?.tag = temp
        }
        
        let gameEnd = puzzleObject.ifWon()
        
        if(gameEnd){
            congratsMessage.textColor = UIColor.yellow
            congratsMessage.isHidden = false
        }else{
            congratsMessage.isHidden = true
        }

        
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        congratsMessage.isHidden = true
        randomizingStartingPosition()
    }
    
    func randomizingStartingPosition(){
        

        var fileName = "Image"
        for i in 1...9{
            fileName = "Image\(i)"
            imagesHere.append(UIImage(named: fileName)!)
        }
        
       


        puzzleObject.initializeArray()
        
        
        var helperCounter = 0
        for i in 1...9{
            let foundButton = self.view.viewWithTag(i) as? UIButton
            foundButton!.tag = puzzleObject.checking[helperCounter] * 10
            foundButton?.setImage(imagesHere[puzzleObject.checking[helperCounter]-1], for: .normal)
            helperCounter = helperCounter + 1
        }
        

        for i in stride(from:10, to:91, by:10){
            let foundButton = self.view.viewWithTag(i) as? UIButton
            let tagFound = foundButton?.tag
            foundButton!.tag = tagFound! / 10
        }

        
        
        
        
    }


}

