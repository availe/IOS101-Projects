//
//  ViewController.swift
//  Trivia
//
//  Created by Mari Batilando on 4/6/23.
//

import UIKit

extension String {
    var removeHTML:String? {
        let data = Data(utf8)
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        let attributedString = try? NSAttributedString (data: data, options: options, documentAttributes: nil)
        return attributedString?.string
    }
}

class TriviaViewController: UIViewController {
  
  @IBOutlet weak var currentQuestionNumberLabel: UILabel!
  @IBOutlet weak var questionContainerView: UIView!
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet weak var answerButton0: UIButton!
  @IBOutlet weak var answerButton1: UIButton!
  @IBOutlet weak var answerButton2: UIButton!
  @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    
    private var questions = [TriviaQuestion]()
  private var currQuestionIndex = 0
  private var numCorrectQuestions = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addGradient()
    questionContainerView.layer.cornerRadius = 8.0
    // TODO: FETCH TRIVIA QUESTIONS HERE
      TriviaQuestionService()
  }
    
    struct APIResponse: Codable {
        let response_code: Int
        let results: [TriviaQuestion]
    }
    
    struct TriviaQuestion: Codable {
        let category: String
        let type: String
        let difficulty: String
        let question: String
        let correctAnswer: String
        let incorrectAnswers: [String]
        
        enum CodingKeys: String, CodingKey {
                case category
                case type
                case difficulty
                case question
                case correctAnswer = "correct_answer"
                case incorrectAnswers = "incorrect_answers"
            }
    }
    
    private func TriviaQuestionService() {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10") else {return}
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            // convert to JSON
            do {
                let instance = try JSONDecoder().decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.questions = instance.results
                    self?.updateQuestion(withQuestionIndex: 0)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    
  private func updateQuestion(withQuestionIndex questionIndex: Int) {
    currentQuestionNumberLabel.text = "Question: \(questionIndex + 1)/\(questions.count)"
    let question = questions[questionIndex]
      questionLabel.text = question.question.removeHTML
    categoryLabel.text = question.category
    let answers = ([question.correctAnswer] + question.incorrectAnswers).shuffled()
      
      answerButton0.isHidden = true
      answerButton1.isHidden = true
      answerButton2.isHidden = true
      answerButton3.isHidden = true
      
    if answers.count > 0 {
        answerButton0.setTitle(answers[0].removeHTML, for: .normal)
        answerButton0.isHidden = false
    }
    if answers.count > 1 {
        answerButton1.setTitle(answers[1].removeHTML, for: .normal)
      answerButton1.isHidden = false
    }
    if answers.count > 2 {
        answerButton2.setTitle(answers[2].removeHTML, for: .normal)
      answerButton2.isHidden = false
    }
    if answers.count > 3 {
        answerButton3.setTitle(answers[3].removeHTML, for: .normal)
      answerButton3.isHidden = false
    }
  }
  
  private func updateToNextQuestion(answer: String) {
    if isCorrectAnswer(answer) {
      numCorrectQuestions += 1
    }
    currQuestionIndex += 1
    guard currQuestionIndex < questions.count else {
      showFinalScore()
      return
    }
    updateQuestion(withQuestionIndex: currQuestionIndex)
  }
  
  private func isCorrectAnswer(_ answer: String) -> Bool {
    return answer == questions[currQuestionIndex].correctAnswer
  }
  
  private func showFinalScore() {
    let alertController = UIAlertController(title: "Game over!",
                                            message: "Final score: \(numCorrectQuestions)/\(questions.count)",
                                            preferredStyle: .alert)
    let resetAction = UIAlertAction(title: "Restart", style: .default) { [unowned self] _ in
      currQuestionIndex = 0
      numCorrectQuestions = 0
      updateQuestion(withQuestionIndex: currQuestionIndex)
    }
    alertController.addAction(resetAction)
    present(alertController, animated: true, completion: nil)
  }
  
  private func addGradient() {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = view.bounds
    gradientLayer.colors = [UIColor(red: 0.54, green: 0.88, blue: 0.99, alpha: 1.00).cgColor,
                            UIColor(red: 0.51, green: 0.81, blue: 0.97, alpha: 1.00).cgColor]
    gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
    gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
    view.layer.insertSublayer(gradientLayer, at: 0)
  }
  
  @IBAction func didTapAnswerButton0(_ sender: UIButton) {
    updateToNextQuestion(answer: sender.titleLabel?.text ?? "")
  }
  
  @IBAction func didTapAnswerButton1(_ sender: UIButton) {
    updateToNextQuestion(answer: sender.titleLabel?.text ?? "")
  }
  
  @IBAction func didTapAnswerButton2(_ sender: UIButton) {
    updateToNextQuestion(answer: sender.titleLabel?.text ?? "")
  }
  
  @IBAction func didTapAnswerButton3(_ sender: UIButton) {
    updateToNextQuestion(answer: sender.titleLabel?.text ?? "")
  }
    
    @IBAction func didTapResetBtn(_ sender: Any) {
        TriviaQuestionService()
        currQuestionIndex = 0
        numCorrectQuestions = 0
    }
    
}

