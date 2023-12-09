//
//  QuizEngineVM.swift
//  Cursed
//
//  Created by Miriam Renken on 08.12.23.
//

import Foundation
import SwiftUI
import AVFoundation


class QuizEngineVM: ObservableObject {
    static var currentQuestion = 0
    @Published var model  = QuizEngineVM.createQuizEngine(i: QuizEngineVM.currentQuestion)
    
    
    static func createQuizEngine(i: Int) -> Quiz {
        return Quiz(currentQuestionIndex: i, quizModel: quizData[i], video: quizData[i].videoID)
    }
    
    func nextQuestion(){
        // advance to next question
        QuizEngineVM.currentQuestion += 1
        if QuizEngineVM.currentQuestion < totalQuestions(){
            self.model = QuizEngineVM.createQuizEngine(i: QuizEngineVM.currentQuestion)
        } else {
            print("No more questions")
        }
    }
    func currentQuestion() -> Int {
        return QuizEngineVM.currentQuestion + 1
    }
    func get_video() -> String {
        return model.video
        
    }
    func totalQuestions() -> Int {
        return QuizEngineVM.quizData.count
    }
    func allDone() -> Bool{
        // add code
        if  currentQuestion() == totalQuestions(){
            return true
        } else {
            return false
        }
    }
    
    
}

//MARK: - Extension
extension QuizEngineVM {

    static var quizData: [QuizModel] {
        [
            QuizModel(question: "Ist Autofahren nur menschlich?",
                      questionImage: "drive",
                      choiceList:
                        [
                            QuizChoices(sysImage: "triangle.fill",choiceText: "Menschlich", isCorrect: true),
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Tierisch"),
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Beides")
                        ],
                      videoID: "Xf32ggObtjM"
                     ),
            QuizModel(question: "Ist Trauern menschlich oder auch im Tierreich zu finden?",
                      questionImage: "grieve",
                      choiceList:
                        [
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Menschlich"),
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Tierisch"),
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Beides", isCorrect: true)
                        ],
                      videoID: ""
                     ),
            QuizModel(question: "Ist Glauben etwas rein menschliches?",
                      questionImage: "thinker",
                      choiceList:
                        [
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Menschlich", isCorrect: true),
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Tierisch"),
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Beides")
                        ],
                      videoID: ""
                     ),
            QuizModel(question: "Ist Körperpflege rein menschlich?",
                      questionImage: "clean",
                      choiceList:
                        [
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Menschlich"),
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Tierisch"),
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Beides", isCorrect: true)
                        ],
                      videoID: "IFACrIx5SZ0"
                     ),
            QuizModel(question: "Sind Machtkämpfe rein animalisch?",
                      questionImage: "thinker",
                      choiceList:
                        [
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Menschlich"),
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Tierisch"),
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Beides", isCorrect: true)
                        ],
                      videoID: ""
                     ),
            QuizModel(question: "Haben nur Menschen ein Gerechtigkeitsempfinden?",
                      questionImage: "grieve",
                      choiceList:
                        [
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Menschlich"),
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Tierisch"),
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Beides", isCorrect: true)
                        ],
                      videoID: "meiU6TxysCg"
                     ),
            QuizModel(question: "Ist soziales Verhalten nur menschlich?",
                      questionImage: "thinker",
                      choiceList:
                        [
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Menschlich"),
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Tierisch"),
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Beides", isCorrect: true)
                        ],
                      videoID: "7MwQYcY479o"
                     ),
            QuizModel(question: "Ist Feiern nur menschlich?",
                      questionImage: "read",
                      choiceList:
                        [
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Menschlich", isCorrect: true),
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Tierisch"),
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Beides")
                        ],
                      videoID: ""
                     ),
            QuizModel(question: "Ist lesen rein menschlich?",
                      questionImage: "read2",
                      choiceList:
                        [
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Menschlich", isCorrect: true),
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Tierisch"),
                            QuizChoices(sysImage: "triangle.fill", choiceText: "Beides")
                        ],
                      videoID: ""
                     )
        ]
    }
}
