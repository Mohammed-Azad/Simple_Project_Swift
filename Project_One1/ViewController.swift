//
//  ViewController.swift
//  Project_One1
//
//  Created by Mohammed's MacBook on 6/12/24.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0

    override func viewDidLoad() {
        super.viewDidLoad()
//        countries.append("spain")
//        countries.append("UK")
//        countries.append("colombia")
//        countries.append("neatherland")
//        countries.append("italy")
//        countries.append("germany")
//        countries.append("ukrain")
        // another way to wirte it
        countries += ["italy","us","canada","neatherland","spain","portogal"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
        
        
        
    }
    func askQuestion(action: UIAlertAction!){
        correctAnswer = Int.random(in: 0...2)
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        title = "choose \(countries[correctAnswer].uppercased()) country flag !"
       
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title:String
        if sender.tag == correctAnswer{
            title = "Correct"
            score+=1
        }else{
            title = "Wrong"
            score-=1
        }
        if score == 10{
            score = 0
        let acc = UIAlertController(title: "Winer", message: "you reach 10 true answer start again", preferredStyle: .alert)
        acc.addAction(UIAlertAction(title: "Finish", style: .default,handler: askQuestion))
        present(acc,animated: true)
        
    }
        
        let ac = UIAlertController(title: title, message: "your score is \(score)",preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default,handler: askQuestion))
                     
        present(ac,animated: true)
          
    }
    
}

