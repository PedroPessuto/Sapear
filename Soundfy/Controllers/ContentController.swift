//
//  ContentController.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 25/09/23.
//

import Foundation
import SwiftUI

class ContentController: ObservableObject {
    
    var soundsSections: [Section]
    
    init(soundsSections: [Section] = [
        Section(sectionName: "Natureza",
                sectionDescription: "Desscrição da seção 1",
                sectionPhases: [
                    Phase(phaseId: UUID(uuidString: "550e8400-e29b-41d4-a716-446655440000")!, phaseName: "Natureza", phaseLessons: [
                        SoundLesson(lessonName: "Natureza", lessonDescription: "Clique nas imagens para descobrir os sons", lessonType: "soundClass", lessonAlternatives: [
                            Alternative(alternativeLabel: "Chuva", alternativeSoundName: "Chuva",
                                alternativeImage: "cloud.rain.fill"),
                            Alternative(alternativeLabel: "Trovão", alternativeSoundName: "Trovao",
                                alternativeImage: "cloud.bolt.fill"),
                            Alternative(alternativeLabel: "Vento", alternativeSoundName: "Vento",
                                alternativeImage: "wind"),
                            Alternative(alternativeLabel: "Furacão", alternativeSoundName: "Furacao",
                                alternativeImage: "tornad")
                            
                        ]),
                        SoundLesson(lessonName: "Natureza", lessonDescription: "Descrição da aula 2", lessonType: "soundClass", lessonAlternatives: [
                            Alternative(alternativeLabel: "Chuva2", alternativeSoundName: "Chuva2"),
                            Alternative(alternativeLabel: "Raio2", alternativeSoundName: "Raio2"),
                            Alternative(alternativeLabel: "Vento2", alternativeSoundName: "Vento2"),
                            Alternative(alternativeLabel: "Explosão2", alternativeSoundName: "Explosão2")
                        ]),
                    ])
                    ,
                    Phase(phaseId: UUID(uuidString: "6ba7b810-9dad-11d1-80b4-00c04fd430c8")!, phaseName: "Fase 2", phaseLessons: [
                        SoundLesson(lessonName: "Natureza", lessonDescription: "Descrição da aula 1", lessonType: "soundClass", lessonAlternatives: [
                            Alternative(alternativeLabel: "Chuva", alternativeSoundName: "Chuva"),
                            Alternative(alternativeLabel: "Raio", alternativeSoundName: "Raio"),
                            Alternative(alternativeLabel: "Vento", alternativeSoundName: "Vento"),
                            Alternative(alternativeLabel: "Explosão", alternativeSoundName: "Explosão")
                        ]),
                        SoundLesson(lessonName: "Natureza", lessonDescription: "Descrição da aula 2", lessonType: "soundClass", lessonAlternatives: [
                            Alternative(alternativeLabel: "Chuva2", alternativeSoundName: "Chuva2"),
                            Alternative(alternativeLabel: "Raio2", alternativeSoundName: "Raio2"),
                            Alternative(alternativeLabel: "Vento2", alternativeSoundName: "Vento2"),
                            Alternative(alternativeLabel: "Explosão2", alternativeSoundName: "Explosão2")
                        ])
                    ])
                    ,
                    Phase(phaseName: "Fase 3", phaseLessons: [
                        SoundLesson(lessonName: "Natureza", lessonDescription: "Descrição da aula 1", lessonType: "soundClass", lessonAlternatives: [
                            Alternative(alternativeLabel: "Chuva", alternativeSoundName: "Chuva"),
                            Alternative(alternativeLabel: "Raio", alternativeSoundName: "Raio"),
                            Alternative(alternativeLabel: "Vento", alternativeSoundName: "Vento"),
                            Alternative(alternativeLabel: "Explosão", alternativeSoundName: "Explosão")
                        ]),
                        SoundLesson(lessonName: "Natureza", lessonDescription: "Descrição da aula 2", lessonType: "soundClass", lessonAlternatives: [
                            Alternative(alternativeLabel: "Chuva2", alternativeSoundName: "Chuva2"),
                            Alternative(alternativeLabel: "Raio2", alternativeSoundName: "Raio2"),
                            Alternative(alternativeLabel: "Vento2", alternativeSoundName: "Vento2"),
                            Alternative(alternativeLabel: "Explosão2", alternativeSoundName: "Explosão2")
                        ])
                    ])
                    
                ]),
        Section(sectionName: "Urbano",
                sectionDescription: "Desscrição da seção 2",
                sectionColor: Color(.blue),
                sectionPhases: [
                    Phase(phaseName: "Fase 1", phaseLessons: [
                        SoundLesson(lessonName: "Urbano", lessonDescription: "Descrição da aula 1", lessonType: "soundClass", lessonAlternatives: [
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
                        ]),
                    ])
                    ,
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
                    ,
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
                    
                ]),
        Section(sectionName: "Seção 3",
                sectionDescription: "Desscrição da seção 3",
                sectionColor: Color(.purple),
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
                        ]),
                    ])
                    ,
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
                    ,
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
    ])
    {
        self.soundsSections = soundsSections
    }
    
}
