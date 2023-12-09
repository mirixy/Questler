//
//  QuizModel.swift
//  Cursed
//
//  Created by Miriam Renken on 08.12.23.
//

import Foundation

struct Quiz {
    var currentQuestionIndex: Int
    var quizModel: QuizModel
    var video: String
}

struct QuizModel {
    var question: String
    var questionImage: String
    var choiceList: [QuizChoices]
    var videoID: String
}

struct QuizChoices: Identifiable {
    var id = UUID()
    var sysImage: String
    var choiceText: String
    var isCorrect: Bool = false
    
}


