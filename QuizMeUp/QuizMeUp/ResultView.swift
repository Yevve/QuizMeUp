//
//  ResultView.swift
//  QuizMeUp
//
//  Created by Yevheniy Zanichkovskyy on 2021-08-13.
//

import UIKit

class ResultView: UIView {

    private let titleLabel = UILabel()
    let resultLabel = UILabel()
    let settingsLabel = UILabel()
    let categoriesLabel = UILabel()
    let button = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        backgroundColor = UIColor(named: "darkBlue")
        titleLabel.textColor = .systemYellow
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.text = NSLocalizedString("Your Result", comment: "Result Title")
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        resultLabel.textColor = .systemYellow
        resultLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        resultLabel.adjustsFontSizeToFitWidth = true
        addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        resultLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor).isActive = true
        settingsLabel.textColor = .systemYellow
        settingsLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        settingsLabel.adjustsFontSizeToFitWidth = true
        addSubview(settingsLabel)
        settingsLabel.translatesAutoresizingMaskIntoConstraints = false
        settingsLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20).isActive = true
        settingsLabel.centerXAnchor.constraint(equalTo: resultLabel.centerXAnchor).isActive = true
        
        categoriesLabel.textColor = .systemYellow
        categoriesLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        categoriesLabel.adjustsFontSizeToFitWidth = true
        addSubview(categoriesLabel)
        categoriesLabel.translatesAutoresizingMaskIntoConstraints = false
        categoriesLabel.topAnchor.constraint(equalTo: settingsLabel.bottomAnchor, constant: 20).isActive = true
        categoriesLabel.centerXAnchor.constraint(equalTo: settingsLabel.centerXAnchor).isActive = true
        categoriesLabel.numberOfLines = 0

        button.setTitleColor(.systemYellow, for: .normal)
        button.setTitle(NSLocalizedString("Reset", comment: "Reset button"), for: .normal)
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    }
    
}
