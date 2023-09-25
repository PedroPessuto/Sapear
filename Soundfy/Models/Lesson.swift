//
//  Lesson.swift.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 25/09/23.
//

import Foundation

protocol Lesson {
    var lessonId: UUID { get }
    var lessonName: String { get set }
    var lessonDescription: String { get set }
    var lessonType: String { get set }
}

class SoundLesson: Lesson {
    var lessonId: UUID
    var lessonName: String
    var lessonDescription: String
    var lessonType: String
    var lessonAlternatives: [Alternative]

    init(lessonId: UUID = UUID(), lessonName: String, lessonDescription: String, lessonType: String, lessonAlternatives: [Alternative]) {
        self.lessonId = lessonId
        self.lessonName = lessonName
        self.lessonDescription = lessonDescription
        self.lessonType = lessonType
        self.lessonAlternatives = lessonAlternatives
    }
}