//
//  QuizGameController.swift
//  QuizMeUp
//
//  Created by Yevheniy Zanichkovskyy on 2020-10-29.
//

import UIKit

class QuizGameController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var buttonAnswerA: UIButton!
    @IBOutlet weak var buttonAnswerB: UIButton!
    @IBOutlet weak var buttonAnswerC: UIButton!
    @IBOutlet weak var buttonAnswerD: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func buttonAnswerAHandler(_ sender: Any) {
        print ("Gibb")
        showWrongAnsewerAlert(button: buttonAnswerA)
    }
    @IBAction func buttonAnswerBHandler(_ sender: Any) {
        print ("pool")
        showWrongAnsewerAlert(button: buttonAnswerB)
    }
    @IBAction func buttonAnswerCHandler(_ sender: Any) {
        print ("meh")
        showWrongAnsewerAlert(button: buttonAnswerC)
    }
    @IBAction func buttonAnswerDHandler(_ sender: Any) {
        print ("Noice")
        showRightAnswerAlert(button: buttonAnswerD)
    }
    
    private func showWrongAnsewerAlert(button:UIButton){
        button.backgroundColor = .red
        buttonAnswerD.backgroundColor = .green
        let alertController = UIAlertController(title: "Wrong answer" ,
                                                message: "Try again.." ,
                                                preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Close",
                                                style: UIAlertAction.Style.default,
                                                handler: {(_)in self.navigationController?.popViewController(animated: true)
        //                                        alertController.dismiss(animated: true, completion: nil)
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    private func showRightAnswerAlert(button:UIButton){
        button.backgroundColor = .green
        let alertController = UIAlertController(title: "Right answer" ,
                                                message: "You got it right" ,
                                                preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Close",
                                                style: UIAlertAction.Style.default,
                                                handler: {(_)in alertController.dismiss(animated: true, completion: nil)
        }))
        present(alertController, animated: true, completion: nil)
    }
}
