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
        
    }
    
    @IBOutlet weak var amountPicker: UITextField!
    @IBOutlet weak var difficultyPicker: UITextField!
        
   
    
    @IBAction func selectMode(_ sender: UIButton){
        
        var difficulty:String = difficultyPicker.text ?? "easy"
        var amountValue:String = amountPicker.text ?? "5"
        var amount = Int(amountValue) ?? 5
        downloadQuestions(amount: amount, difficulty: difficulty)
    }
        @IBAction func scoreButtonHandler(_ sender: Any) {
        let scoreTableViewController = ScoreTableViewController()
        navigationController?.pushViewController(scoreTableViewController, animated: true)
        
    }
   
    
    private func downloadQuestions(amount:Int,difficulty:String){
        guard let url = URL(string: "https://opentdb.com/api.php?amount=\(amount)&type=multiple&difficulty=\(difficulty)")
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
        
           
            quizGameController.numberOfQuestions = questions.count
            quizGameController.questions = questions
        }
    }
    

}
