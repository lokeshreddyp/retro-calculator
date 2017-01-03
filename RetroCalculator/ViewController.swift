//
//  ViewController.swift
//  RetroCalculator
//
//  Created by lokeshreddy on 12/29/16.
//  Copyright © 2016 lokeshreddy. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {


    enum Operation:String {
        case Division = "/"
        case Multiplication = "*"
        case Subtraction = "-"
        case Addition = "+"
        case Empty = "Empty"
    }
    
    var currentoperation = Operation.Empty
    
    var rightValStr = ""
    var leftValStr = ""
    var result = ""
    @IBOutlet weak var outputLBL: UILabel!
    
    var runningnumber = ""
    
    var btnSound : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        
        let soundURL = URL(fileURLWithPath: path!)
        
        do {
           try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
        }
        catch let err as NSError {
            print(btnSound.debugDescription)
        }
        
        
    }

    
    
    
    
    @IBAction func DivideBTN(_ sender: Any) {
         processOperation(operation: .Division)
    }
    
    @IBAction func MultiplyBTN(_ sender: Any) {
        processOperation(operation: .Multiplication)
    }
    
    
    
    @IBAction func SubtractBTN(_ sender: Any) {
   
    processOperation(operation: .Subtraction)
    }
   
    
    
    
    @IBAction func AddBTN(_ sender: Any) {
         processOperation(operation: .Addition)
    }
    
    
  
  
    
 
    @IBAction func Equalspressed(_ sender: Any) {
                processOperation(operation: currentoperation)
    }
    
   
    
    func processOperation(operation: Operation) {
        if currentoperation != Operation.Empty
        {
            if runningnumber != "" {
            rightValStr = runningnumber
                runningnumber = ""
                
                if currentoperation == Operation.Multiplication {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                }
                else if currentoperation == Operation.Division {
                   result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                }
                
                else if currentoperation == Operation.Addition {
                  result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                
                else if currentoperation == Operation.Subtraction {
                   result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                }
                leftValStr = result
                outputLBL.text = result
                
            }
            currentoperation = operation
        }
        else {
            leftValStr = runningnumber
            runningnumber = ""
            currentoperation = operation
            
        }
    }
    
    
    @IBAction func ClearBTN(_ sender: Any) {
        
        outputLBL.text = "0"
        runningnumber = ""
        
    }
    
    
   
    @IBAction func BTN(_ sender: UIButton) {
        playsound()
        
        
        runningnumber += "\(sender.tag)"
        outputLBL.text = runningnumber
    }
    
    func playsound() {
        if btnSound.isPlaying {
            btnSound.stop()
        }
        btnSound.play()
    }

}


