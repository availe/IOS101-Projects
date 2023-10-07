//
//  ViewController.swift
//  Trivia
//
//  Created by Rafael Diaz on 10/6/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        display()
    }
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var catLabel: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    @IBAction func press1(_ sender: Any) {
        btnPress(sender as! UIButton)
    }
    @IBAction func press2(_ sender: Any) {
        btnPress(sender as! UIButton)
    }
    @IBAction func press3(_ sender: Any) {
        btnPress(sender as! UIButton)
    }
    @IBAction func press4(_ sender: Any) {
        btnPress(sender as! UIButton)
    }
    
    struct QuestionStruct {
        let questionText: String
        let catLabel: String
        let option: [String]
        let answer: String
    }
    
    let questionList = [
        QuestionStruct(questionText: "What is the capital of France?", catLabel: "Geography",  option: ["Paris", "London", "Berlin", "Rome"], answer: "Paris"),
        QuestionStruct(questionText: "Who discovered general relativity?", catLabel: "Science", option: ["Albert Einstein", "Marie Curie", "Mozart", "Washington"], answer: "Albert Einstein"),
        QuestionStruct(questionText: "What is the largest animal?", catLabel: "Biology", option: ["Cheetah", "Lion", "Elephant", "Blue whale"], answer: "Blue whale"),
        QuestionStruct(questionText: "Which of the following is a fruit?", catLabel: "Culinary", option: ["Strawberry", "Broccoli", "Celery", "Lettuce"], answer: "Strawberry"),
    ]
    
    var questionCounter = 0, correctCounter = 0
    
    func display() {
        guard questionCounter < questionList.count else {
            return
        }
        
            let q = questionList[questionCounter]
            updateTopLabel(i: questionCounter + 1, j: questionList.count)
            updateQuestion(s: q.questionText)
            updateOptions(s: q.option)
            updateCatLabel(s: q.catLabel)
    }
    
    func updateTopLabel(i: Int, j: Int) {
        topLabel.text = "Question: \(i)/\(j)"
    }
    
    func updateCatLabel(s: String) {
        catLabel.text = s
    }
    
    func updateQuestion(s: String) {
        question.text = s
    }
    
    func updateOptions(s: [String]) {
        let options = [option1, option2, option3, option4]
        for i in 0..<s.count {
            options[i]?.setTitle(s[i], for: .normal)
        }
    }
    
    @IBAction func btnPress(_ sender: UIButton) {
        if let selected = sender.title(for: .normal) {
            let currQuestion = questionList[questionCounter]
            if selected == currQuestion.answer {
                correctCounter+=1
            }
            questionCounter+=1
            display()
        }
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
