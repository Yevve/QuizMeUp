//
//  StartViewController.swift
//  QuizMeUp
//
//  Created by Yevheniy Zanichkovskyy on 2021-08-13.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    var questions: [Question] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.isEnabled = false
        startButton.setTitleColor(.systemRed, for: .disabled)
        downloadQuestions(amount: 5)
    }
    
    private func downloadQuestions(amount:Int){
        guard let url = URL(string: "https://opentdb.com/api.php?amount=\(amount)&type=multiple")
        else{
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else{
                
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let questionsResult = try? decoder.decode(QuestionsResult.self, from: data)
            self?.questions = questionsResult?.results ?? []
            DispatchQueue.main.async {
                self?.startButton.isEnabled = true
            }
        }
        task.resume()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let quizGameController = segue.destination as? QuizGameController{
            /*let question1 = Question(category: "Bars", type:.multiple, difficulty: .easy, question: "What is your favorit bar?", correctAnswers: "Aka", incorrectAnswers: ["Kappa","Twin","Shooters"])
            let question2 = Question(category: "Booze", type: .multiple, difficulty: .easy, question: "What is your favorit booze", correctAnswers: "Donk", incorrectAnswers: ["Cider","Wine","Beer"])
             let questions = [question1,question2]
             */
            
            quizGameController.numberOfQuestions = questions.count
            quizGameController.questions = questions
        }
    }
    

}
