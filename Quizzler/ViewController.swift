//
//  ViewController.swift
//  Quizzler
//
//  Created by Никита Ясеник on 19.01.2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    private lazy var headLabel: UILabel = {
        let label = UILabel()
        label.text = quiz[0][0]
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = label.font.withSize(30)

        return label
    }()
    
    private lazy var trueButton: UIButton = {
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.title = "True"
        buttonConfig.baseForegroundColor = .white
        buttonConfig.background.strokeColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        buttonConfig.background.strokeWidth = 5
        buttonConfig.background.cornerRadius = 20
        buttonConfig.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont(name: "TimesNewRomanPSMT", size: 30) ?? .systemFont(ofSize: 40)
            return outgoing
         }

        let button = UIButton(configuration: buttonConfig, primaryAction: UIAction(){_ in
            self.setNewQuestions(ans: buttonConfig.title!)
        })
        button.translatesAutoresizingMaskIntoConstraints = false
    
        
        return button
    }()
    
    private lazy var falseButton: UIButton = {
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.title = "False"
        buttonConfig.baseForegroundColor = .white
        buttonConfig.background.strokeColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        buttonConfig.background.strokeWidth = 5
        buttonConfig.background.cornerRadius = 20
        buttonConfig.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont(name: "TimesNewRomanPSMT", size: 30) ?? .systemFont(ofSize: 40)
            return outgoing
         }

        let button = UIButton(configuration: buttonConfig, primaryAction: UIAction(){ _ in
            self.setNewQuestions(ans: buttonConfig.title!)
        })
        button.translatesAutoresizingMaskIntoConstraints = false
    
        
        return button
    }()
    
    private lazy var progressBar: UIProgressView = {
        let progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.backgroundColor = .red
        
        return progress
    }()
    
    let quiz = [
        ["Four + Two is equal Six?", "True"],
        ["Questions 2 ...", "False"],
        ["Questions 3 ...", "True"]
    ]
    
    
    var questionsNumber = 0
    
    func setNewQuestions(ans str: String) {
        if str == quiz[questionsNumber][1] {
            print("Right")
        }
        else {
            print("Miss")
        }
        if questionsNumber < quiz.count - 1 {
            questionsNumber += 1
            updateView()
        }
        else {
            questionsNumber = 0
            updateView()
        }
        
    }
    
    func updateView() {
        headLabel.text = quiz[questionsNumber][0]
        progressBar.progress = Float(questionsNumber + 1) / Float(quiz.count)
    }
    
    func setupView() {
        view.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        view.addSubview(headLabel)
        view.addSubview(trueButton)
        view.addSubview(falseButton)
        view.addSubview(progressBar)
        
        
        NSLayoutConstraint.activate([
            headLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            headLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
            headLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            trueButton.topAnchor.constraint(equalTo: headLabel.bottomAnchor, constant: 10),
            trueButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            trueButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            trueButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.09),
            falseButton.topAnchor.constraint(equalTo: trueButton.bottomAnchor, constant: 15),
            falseButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            falseButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            falseButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.09),
            progressBar.topAnchor.constraint(equalTo: falseButton.bottomAnchor, constant: 50),
            progressBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            progressBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
            
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }


}


struct MyProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            return ViewController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
