/// Copyright (c) 2020 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation

struct QuestionViewData {
  public let answer:String
  public let hint:String
  public let prompt:String
  
  public init(_ question:Question) {
    answer = question.answer
    hint = question.hint ?? "No hint"
    prompt = question.prompt
  }
}

protocol QuestionViewDelegate: NSObjectProtocol {
  func showQuestion(_ question:QuestionViewData)
  func showCorrectCount(_ correctCount:Int)
  func showIncorrectCount(_ incorrectCount:Int)
}
class QuestionPresenter: NSObject {
  
  weak private var questionViewDelegate: QuestionViewDelegate?
  private var gameData = QuestionAnswerGameData()
  func setViewDelegate(questionViewDelegate:QuestionViewDelegate?) {
      self.questionViewDelegate = questionViewDelegate
  }
  
  func resetQuestionAnswerGame() {
    gameData.resetGame()
    self.showQuestion()
    self.questionViewDelegate?.showCorrectCount(gameData.correctCount)
    self.questionViewDelegate?.showIncorrectCount(gameData.incorrectCount)
  }
  
  func handleCorrect() {
    gameData.increaseCorrectCount()
    self.questionViewDelegate?.showCorrectCount(gameData.correctCount)
    self.nextQuestion()
  }
  
  func handleIncorrect() {
    gameData.increaseIncorrectCount()
    self.questionViewDelegate?.showIncorrectCount(gameData.incorrectCount)
    self.nextQuestion()
  }
  
  func nextQuestion() {
    gameData.nextQuestion()
    self.showQuestion()
  }

  
  private func showQuestion() {
    let question = gameData.getQuestion()
    let questionViewData = QuestionViewData(question)
    self.questionViewDelegate?.showQuestion(questionViewData)
  }
  

}
