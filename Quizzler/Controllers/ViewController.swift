//
//  ViewController.swift
//  Quizzler
//
//  Created by Tran Thanh Bang on 5/5/18.
//  Copyright © 2018 Tran Thanh Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var progressBarWidthConstrant: NSLayoutConstraint!
    
    let allQuestions = QuestionBank()
    var indexQuestion : Int = 0
    var scores : Int = 0
    var pickedAnswer : Bool = false
    var isLastestQuestion : Bool = false
    let screenSize = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = allQuestions.list[0].questionText;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadQuestion(){
        print(indexQuestion)
        if indexQuestion >= allQuestions.list.count - 1 {
            isLastestQuestion = true
            return;
        }
        indexQuestion += 1;
        questionLabel.text = allQuestions.list[indexQuestion].questionText;
        progressLabel.text = String(format: "%i/%i", indexQuestion+1,allQuestions.list.count)
        scoreLabel.text = String(format: "%i", scores)
        UIView.animate(withDuration: 0.5) {
            self.progressBarWidthConstrant.constant = CGFloat(Float(self.indexQuestion + 1) * Float(self.screenSize.width)/13)
        }
    }
    
    func checkAnsert(pickedAnswer answer : Bool){
        if answer == allQuestions.list[indexQuestion].answer{
            scores += 1
            ProgressHUD.showSuccess("Correct")
        }else{
            ProgressHUD.showError("Wrong")
        }
        loadQuestion()
    }
    
    func updateUI(){
        
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Awesome", message: "You're have finished all the questions, do you want to start over? ", preferredStyle: .alert)
        let resetAction = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            self.startOver()
        }
        alert.addAction(resetAction)
        present(alert, animated: true, completion: nil)
    }
    
    func startOver(){
        scores = 0;
        indexQuestion = -1;
        isLastestQuestion = false
        loadQuestion()
    }
    
    @IBAction func clickToAnswer(_ sender: UIButton) {
        print(sender.tag)
        pickedAnswer = sender.tag == 1 ? true : false
        checkAnsert(pickedAnswer: pickedAnswer)
        if isLastestQuestion {
            showAlert()
        }
    }
}

