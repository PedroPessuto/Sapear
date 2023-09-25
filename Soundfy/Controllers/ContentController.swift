//
//  ContentController.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 25/09/23.
//

import Foundation

class ContentController {
    
    var sections: [Section]

    init(sections: [Section] = [
        Section(sectionName: "Seção 1",
                sectionDescription: "Desscrição da seção 1",
                sectionPhases: [
                    Phase(phaseName: "Fase 1", phaseLessons: [
                        SoundLesson(lessonName: "Aula 1", lessonDescription: "Descrição da aula 1", lessonType: "soundClass", lessonAlternatives: [
                            Alternative(alternativeLabel: "Chuva", alternativeSoundName: "Chuva"),
                            Alternative(alternativeLabel: "Raio", alternativeSoundName: "Raio"),
                            Alternative(alternativeLabel: "Vento", alternativeSoundName: "Vento"),
                            Alternative(alternativeLabel: "Explosão", alternativeSoundName: "Explosão")
                        ]),
                        SoundLesson(lessonName: "Aula 2", lessonDescription: "Descrição da aula 2", lessonType: "soundClass", lessonAlternatives: [
                            Alternative(alternativeLabel: "Chuva2", alternativeSoundName: "Chuva2"),
                            Alternative(alternativeLabel: "Raio2", alternativeSoundName: "Raio2"),
                            Alternative(alternativeLabel: "Vento2", alternativeSoundName: "Vento2"),
                            Alternative(alternativeLabel: "Explosão2", alternativeSoundName: "Explosão2")
                        ])
                    ]),
                    Phase(phaseName: "Fase 2", phaseLessons: [
                        SoundLesson(lessonName: "Aula 1", lessonDescription: "Descrição da aula 1", lessonType: "soundClass", lessonAlternatives: [
                            Alternative(alternativeLabel: "Chuva", alternativeSoundName: "Chuva"),
                            Alternative(alternativeLabel: "Raio", alternativeSoundName: "Raio"),
                            Alternative(alternativeLabel: "Vento", alternativeSoundName: "Vento"),
                            Alternative(alternativeLabel: "Explosão", alternativeSoundName: "Explosão")
                        ]),
                        SoundLesson(lessonName: "Aula 2", lessonDescription: "Descrição da aula 2", lessonType: "soundClass", lessonAlternatives: [
                            Alternative(alternativeLabel: "Chuva2", alternativeSoundName: "Chuva2"),
                            Alternative(alternativeLabel: "Raio2", alternativeSoundName: "Raio2"),
                            Alternative(alternativeLabel: "Vento2", alternativeSoundName: "Vento2"),
                            Alternative(alternativeLabel: "Explosão2", alternativeSoundName: "Explosão2")
                        ])
                    ])
                ])
    
    ]) {
        self.sections = sections
    }
    
}
