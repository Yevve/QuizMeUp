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
    
    private var playerWon = false
    var questions: [Question] = []{
        didSet{
            question = questions.removeFirst()
        }
    }
    var question: Question?
    var numberOfQuestions = 0
    var numberOfCorrectAnswers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var buttons = [buttonAnswerA,buttonAnswerB,buttonAnswerC,buttonAnswerD]
        
        questionLabel.text = question?.question
        buttons.shuffle()
        let correctButton = buttons.removeFirst()
        correctButton?.setTitle(question?.correctAnswer, for: .normal)
        
        question?.incorrectAnswers.forEach({ (answer) in
            let button = buttons.removeFirst()
            button?.setTitle(answer, for: .normal)
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("View did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("View will disappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("View did disappear")
    }
    
    @IBAction func buttonAnswerAHandler(_ sender: Any) {
        if buttonAnswerA.title(for: .normal) == question?.correctAnswer{
            showRightAnswerAlert(button: buttonAnswerA)
        }else{
            showWrongAnsewerAlert(button: buttonAnswerA)
        }
    }
    @IBAction func buttonAnswerBHandler(_ sender: Any) {
        if buttonAnswerB.title(for: .normal) == question?.correctAnswer{
            showRightAnswerAlert(button: buttonAnswerB)
        }else{
            showWrongAnsewerAlert(button: buttonAnswerB)
        }
    }
    @IBAction func buttonAnswerCHandler(_ sender: Any) {
        if buttonAnswerC.title(for: .normal) == question?.correctAnswer{
            showRightAnswerAlert(button: buttonAnswerC)
        }else{
            showWrongAnsewerAlert(button: buttonAnswerC)
        }
    }
    @IBAction func buttonAnswerDHandler(_ sender: Any) {
        if buttonAnswerD.title(for: .normal) == question?.correctAnswer{
            showRightAnswerAlert(button: buttonAnswerD)
        }else{
            showWrongAnsewerAlert(button: buttonAnswerD)
        }
    }
    
    private func showWrongAnsewerAlert(button:UIButton){
        button.backgroundColor = .red
        
        let alertController = UIAlertController(title: "Wrong answer" ,
                                                message: "Try again.." ,
                                                preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Close",
                                                style: UIAlertAction.Style.default,
                                                handler: {[weak self](_)in
                                                    self?.goToNextQuestion()
                                       
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    private func showRightAnswerAlert(button:UIButton){
        playerWon = true
        numberOfCorrectAnswers += 1
        button.backgroundColor = .green
        let alertController = UIAlertController(title: "Right answer" ,
                                                message: "You got it right" ,
                                                preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Close",
                                                style: UIAlertAction.Style.default,
                                                handler: {[weak self](_)in
                                                    self?.goToNextQuestion()
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    private func goToNextQuestion(){
        guard questions.isEmpty == false,
              let quizGameController = storyboard?.instantiateViewController(withIdentifier: "QuizGameController") as? QuizGameController else {
            performSegue(withIdentifier: "ResultView", sender: nil)
            return
        }
        quizGameController.numberOfQuestions = numberOfQuestions
        quizGameController.numberOfCorrectAnswers = numberOfCorrectAnswers
        quizGameController.questions = questions
        navigationController?.pushViewController(quizGameController, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultViewController = segue.destination as? ResultViewController{
            resultViewController.resultView.resultLabel.text = "You won! You answered \(numberOfCorrectAnswers) of \(numberOfQuestions) correct"
        }
    }
        
}
