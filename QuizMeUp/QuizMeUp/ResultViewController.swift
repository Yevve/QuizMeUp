//
//  ResultViewController.swift
//  QuizMeUp
//
//  Created by Yevheniy Zanichkovskyy on 2021-08-13.
//

import UIKit

class ResultViewController: UIViewController {

    let resultView = ResultView()
    
    override func loadView() {
        view = resultView
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        resultView.button.addTarget(self, action: #selector(resetButtonHandler), for:.touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @objc private func resetButtonHandler(){
        navigationController?.popToRootViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
