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
    var phonemesSection: [Section]
    
    init(soundsSections: [Section] = [
        // Seção NATUREZA
        Section(sectionId: UUID(uuidString: "550e8400-e29b-41d4-a716-446655440000")!,
                sectionName: "NATUREZA",
                sectionDescription: "Sons da natureza.",
                sectionPhases: [
                    Phase(phaseId: UUID(uuidString: "550e8410-e29b-41d4-a716-446655440001")!,
                          phaseName: "Natureza",
                          phaseLessons: [
                            SoundLesson(lessonId: UUID(uuidString: "550e8420-e29b-41d4-a716-446655440002")!,
                                        lessonName: "Sons da Natureza 1",
                                        lessonDescription: "Aprenda os primeiros sons da natureza.",
                                        lessonType: "soundClass",
                                        lessonAlternatives: [
                                            Alternative(alternativeId: UUID(uuidString: "550e8430-e29b-41d4-a716-446655440003")!,
                                                        alternativeLabel: "Chuva",
                                                        alternativeSoundName: "ChuvaSound",
                                                        alternativeImage: "cloud.rain.fill"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8440-e29b-41d4-a716-446655440004")!,
                                                        alternativeLabel: "Onda",
                                                        alternativeSoundName: "OndaSound",
                                                        alternativeImage: "water.waves"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8450-e29b-41d4-a716-446655440005")!,
                                                        alternativeLabel: "Vento",
                                                        alternativeSoundName: "VentoSound",
                                                        alternativeImage: "wind"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8460-e29b-41d4-a716-446655440006")!,
                                                        alternativeLabel: "Trovão",
                                                        alternativeSoundName: "TrovãoSound",
                                                        alternativeImage: "cloud.bolt.rain")
                                        ]),
                            //... repita para todos os grupos de 4 sons em "NATUREZA"
                          ],
                          phaseExercises: [
                            SoundExercise(exerciseId: UUID(uuidString: "550e8480-e29b-41d4-a716-446655440009")!,
                                          exerciseName: "Identifique o som",
                                          exerciseDescription: "Qual destes é o som da Chuva?",
                                          exerciseType: "soundExercise",
                                          exerciseAlternatives: [
                                            Alternative(alternativeId: UUID(uuidString: "550e8490-e29b-41d4-a716-446655440010")!,
                                                        alternativeLabel: "Chuva",
                                                        alternativeSoundName: "ChuvaSound",
                                                        alternativeImage: "cloud.rain.fill"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8500-e29b-41d4-a716-446655440011")!,
                                                        alternativeLabel: "Trovão",
                                                        alternativeSoundName: "TrovãoSound",
                                                       alternativeImage: "cloud.bolt.rain"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8510-e29b-41d4-a716-446655440012")!,
                                                        alternativeLabel: "Onda",
                                                        alternativeSoundName: "OndaSound",
                                                        alternativeImage: "water.waves"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8520-e29b-41d4-a716-446655440013")!,
                                                        alternativeLabel: "Vento",
                                                        alternativeSoundName: "VentoSound",
                                                        alternativeImage: "wind")
                                          ],
                                          exerciseAnswer: 2)
                            , SoundExercise(exerciseId: UUID(uuidString: "550e8480-e29b-41d4-a716-446655410009")!,
                                            exerciseName: "Identifique o som",
                                            exerciseDescription: "Qual destes é o som da Chuva?",
                                            exerciseType: "soundExercise",
                                            exerciseAlternatives: [
                                              Alternative(alternativeId: UUID(uuidString: "550e8500-e29b-41d4-a716-446655410011")!,
                                                          alternativeLabel: "Trovão",
                                                          alternativeSoundName: "TrovãoSound",
                                                         alternativeImage: "cloud.bolt.rain"),
                                              Alternative(alternativeId: UUID(uuidString: "550e8510-e29b-41d4-a716-446655410012")!,
                                                          alternativeLabel: "Onda",
                                                          alternativeSoundName: "OndaSound",
                                                          alternativeImage: "water.waves"),
                                              Alternative(alternativeId: UUID(uuidString: "550e8490-e29b-41d4-a716-446655410010")!,
                                                          alternativeLabel: "Chuva",
                                                          alternativeSoundName: "ChuvaSound",
                                                          alternativeImage: "cloud.rain.fill"),
                                              Alternative(alternativeId: UUID(uuidString: "550e8520-e29b-41d4-a716-446655410013")!,
                                                          alternativeLabel: "Vento",
                                                          alternativeSoundName: "VentoSound",
                                                          alternativeImage: "wind")
                                            ],
                                            exerciseAnswer: 2)
                            //... repita para cada som específico como exercício em "NATUREZA"
                          ]),
                    Phase(phaseId: UUID(uuidString: "550e8410-e29b-41d4-a716-446555440019")!,
                          phaseName: "Natureza",
                          phaseLessons: [
                            SoundLesson(lessonId: UUID(uuidString: "550e8530-e29b-41d4-a716-446655440020")!,
                                        lessonName: "Sons da Natureza 2",
                                        lessonDescription: "Aprenda mais sons da natureza.",
                                        lessonType: "soundClass",
                                        lessonAlternatives: [
                                            Alternative(alternativeId: UUID(uuidString: "550e8540-e29b-41d4-a716-446655440021")!,
                                                        alternativeLabel: "Cachorro",
                                                        alternativeSoundName: "CachorroSound",
                                                       alternativeImage: "dog"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8550-e29b-41d4-a716-446655440022")!,
                                                        alternativeLabel: "Gato",
                                                        alternativeSoundName: "GatoSound",
                                                       alternativeImage: "cat"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8560-e29b-41d4-a716-446655440023")!,
                                                        alternativeLabel: "Galinha",
                                                        alternativeSoundName: "GalinhaSound",
                                                       alternativeImage: "chicken"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8570-e29b-41d4-a716-446655440024")!,
                                                        alternativeLabel: "Trigre",
                                                        alternativeSoundName: "TrigreSound",
                                                       alternativeImage: "tiger")
                                        ]),
                            //... repita para todos os grupos de 4 sons em "NATUREZA"
                          ],
                          phaseExercises: [
                            SoundExercise(exerciseId: UUID(uuidString: "550e8630-e29b-41d4-a716-446655440040")!,
                                          exerciseName: "Identifique o som",
                                          exerciseDescription: "Qual destes é o som de um Cachorro?",
                                          exerciseType: "soundExercise",
                                          exerciseAlternatives: [
                                            Alternative(alternativeId: UUID(uuidString: "550e8640-e29b-41d4-a716-446655440041")!,
                                                        alternativeLabel: "Gato",
                                                        alternativeSoundName: "GatoSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8650-e29b-41d4-a716-446655440042")!,
                                                        alternativeLabel: "Cachorro",
                                                        alternativeSoundName: "CachorroSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8660-e29b-41d4-a716-446655440043")!,
                                                        alternativeLabel: "Galinha",
                                                        alternativeSoundName: "GalinhaSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8570-e29b-41d4-a716-446655440024")!,
                                                        alternativeLabel: "Trigre",
                                                        alternativeSoundName: "TrigreSound",
                                                       alternativeImage: "tiger")
                                            
                                          ],
                                          exerciseAnswer: 1)
                            //... repita para cada som específico como exercício em "NATUREZA"
                          ])
                    ,
                    Phase(phaseId: UUID(uuidString: "550e8410-e29b-41d4-a716-446655440029")!,
                          phaseName: "Natureza",
                          phaseLessons: [
                            SoundLesson(lessonId: UUID(uuidString: "550e8580-e29b-41d4-a716-446655440030")!,
                                        lessonName: "Sons da Natureza 3",
                                        lessonDescription: "Aprenda ainda mais sons da natureza.",
                                        lessonType: "soundClass",
                                        lessonAlternatives: [
                                            Alternative(alternativeId: UUID(uuidString: "550e8590-e29b-41d4-a716-446655440031")!,
                                                        alternativeLabel: "Baleia",
                                                        alternativeSoundName: "BaleiaSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8600-e29b-41d4-a716-446655440032")!,
                                                        alternativeLabel: "Vaca",
                                                        alternativeSoundName: "VacaSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8610-e29b-41d4-a716-446655440033")!,
                                                        alternativeLabel: "Porco",
                                                        alternativeSoundName: "PorcoSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8620-e29b-41d4-a716-446655440034")!,
                                                        alternativeLabel: "Macaco",
                                                        alternativeSoundName: "MacacoSound")
                                        ]),
                            //... repita para todos os grupos de 4 sons em "NATUREZA"
                          ],
                          phaseExercises: [
                            SoundExercise(exerciseId: UUID(uuidString: "550e8630-e29b-41d4-a716-446655440050")!,
                                          exerciseName: "Identifique o som",
                                          exerciseDescription: "Qual destes é o som de um Vaca?",
                                          exerciseType: "soundExercise",
                                          exerciseAlternatives: [
                                            Alternative(alternativeId: UUID(uuidString: "550e8640-e29b-41d4-a716-446655440051")!,
                                                        alternativeLabel: "Baleia",
                                                        alternativeSoundName: "BaleiaSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8650-e29b-41d4-a716-446655440052")!,
                                                        alternativeLabel: "Macaco",
                                                        alternativeSoundName: "MacacoSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8660-e29b-41d4-a716-446655440053")!,
                                                        alternativeLabel: "Porco",
                                                        alternativeSoundName: "PorcoSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8670-e29b-41d4-a716-446655440054")!,
                                                        alternativeLabel: "Vaca",
                                                        alternativeSoundName: "VacaSound")
                                          ],
                                          exerciseAnswer: 3)
                            //... repita para cada som específico como exercício em "NATUREZA"
                          ])
                ]),
        Section(sectionId: UUID(uuidString: "550e8400-e29b-41d4-a716-446655440060")!,
                sectionName: "URBANO",
                sectionDescription: "Sons Urbanos.",
                sectionPhases: [
                    Phase(phaseId: UUID(uuidString: "550e8410-e29b-41d4-a716-446655440061")!,
                          phaseName: "Urbano",
                          phaseLessons: [
                            SoundLesson(lessonId: UUID(uuidString: "550e8420-e29b-41d4-a716-446655440062")!,
                                        lessonName: "Sons Urbanos 1",
                                        lessonDescription: "Aprenda os primeiros sons Urbanos.",
                                        lessonType: "soundClass",
                                        lessonAlternatives: [
                                            Alternative(alternativeId: UUID(uuidString: "550e8430-e29b-41d4-a716-446655440063")!,
                                                        alternativeLabel: "Carro",
                                                        alternativeSoundName: "CarroSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8440-e29b-41d4-a716-446655440064")!,
                                                        alternativeLabel: "Buzina",
                                                        alternativeSoundName: "BuzinaSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8450-e29b-41d4-a716-446655440065")!,
                                                        alternativeLabel: "Avião",
                                                        alternativeSoundName: "AviãoSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8460-e29b-41d4-a716-446655440066")!,
                                                        alternativeLabel: "Relógio",
                                                        alternativeSoundName: "RelógioSound")
                                        ]),
                            //... repita para todos os grupos de 4 sons em "NATUREZA"
                          ],
                          phaseExercises: [
                            SoundExercise(exerciseId: UUID(uuidString: "550e8480-e29b-41d4-a716-449966440069")!,
                                          exerciseName: "Identifique o som",
                                          exerciseDescription: "Qual destes é o som da Buzina?",
                                          exerciseType: "soundExercise",
                                          exerciseAlternatives: [
                                            Alternative(alternativeId: UUID(uuidString: "550e8490-e29b-41d4-a716-446655440070")!,
                                                        alternativeLabel: "Alarme",
                                                        alternativeSoundName: "AlarmeSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8500-e29b-41d4-a716-446655440071")!,
                                                        alternativeLabel: "Relógio",
                                                        alternativeSoundName: "RelógioSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8510-e29b-41d4-a716-446655440072")!,
                                                        alternativeLabel: "Carro",
                                                        alternativeSoundName: "CarroSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8520-e29b-41d4-a716-446655440073")!,
                                                        alternativeLabel: "Buzina",
                                                        alternativeSoundName: "BuzinaSound")
                                          ],
                                          exerciseAnswer: 3)
                            //                            ... repita para cada som específico como exercício em "NATUREZA"
                          ])
                    ,
                    Phase(phaseId: UUID(uuidString: "550e8410-e29b-41d4-a716-446655440079")!,
                          phaseName: "Urbano",
                          phaseLessons: [
                            SoundLesson(lessonId: UUID(uuidString: "550e8530-e29b-41d4-a716-446655440080")!,
                                        lessonName: "Sons Urbanos 2",
                                        lessonDescription: "Aprenda mais sons Urbanos.",
                                        lessonType: "soundClass",
                                        lessonAlternatives: [
                                            Alternative(alternativeId: UUID(uuidString: "550e8540-e29b-41d4-a716-446655440081")!,
                                                        alternativeLabel: "Cachorro",
                                                        alternativeSoundName: "CachorroSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8550-e29b-41d4-a716-446655440082")!,
                                                        alternativeLabel: "Gato",
                                                        alternativeSoundName: "GatoSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8560-e29b-41d4-a716-446655440083")!,
                                                        alternativeLabel: "Galinha",
                                                        alternativeSoundName: "GalinhaSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8570-e29b-41d4-a716-446655440084")!,
                                                        alternativeLabel: "Leão",
                                                        alternativeSoundName: "LeãoSound")
                                        ]),
                            //... repita para todos os grupos de 4 sons em "NATUREZA"
                          ],
                          phaseExercises: [
                            SoundExercise(exerciseId: UUID(uuidString: "550e8630-e29b-41d4-a716-446655440090")!,
                                          exerciseName: "Identifique o som",
                                          exerciseDescription: "Qual destes é o som de um Cachorro?",
                                          exerciseType: "soundExercise",
                                          exerciseAlternatives: [
                                            Alternative(alternativeId: UUID(uuidString: "550e8640-e29b-41d4-a716-446655440091")!,
                                                        alternativeLabel: "Gato",
                                                        alternativeSoundName: "GatoSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8650-e29b-41d4-a716-446655440092")!,
                                                        alternativeLabel: "Cachorro",
                                                        alternativeSoundName: "CachorroSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8660-e29b-41d4-a716-446655440093")!,
                                                        alternativeLabel: "Galinha",
                                                        alternativeSoundName: "GalinhaSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8670-e29b-41d4-a716-446655440094")!,
                                                        alternativeLabel: "Leão",
                                                        alternativeSoundName: "LeãoSound")
                                          ],
                                          exerciseAnswer: 1)
                            //... repita para cada som específico como exercício em "NATUREZA"
                          ])
                    ,
                    Phase(phaseId: UUID(uuidString: "550e8410-e29b-41d4-a716-446655440100")!,
                          phaseName: "Natureza",
                          phaseLessons: [
                            SoundLesson(lessonId: UUID(uuidString: "550e8580-e29b-41d4-a716-446655440100")!,
                                        lessonName: "Sons da Natureza 3",
                                        lessonDescription: "Aprenda ainda mais sons da natureza.",
                                        lessonType: "soundClass",
                                        lessonAlternatives: [
                                            Alternative(alternativeId: UUID(uuidString: "550e8590-e29b-41d4-a716-446655440101")!,
                                                        alternativeLabel: "Baleia",
                                                        alternativeSoundName: "BaleiaSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8600-e29b-41d4-a716-446655440102")!,
                                                        alternativeLabel: "Vaca",
                                                        alternativeSoundName: "VacaSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8610-e29b-41d4-a716-446655440103")!,
                                                        alternativeLabel: "Porco",
                                                        alternativeSoundName: "PorcoSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8620-e29b-41d4-a716-446655440104")!,
                                                        alternativeLabel: "Macaco",
                                                        alternativeSoundName: "MacacoSound")
                                        ]),
                            //... repita para todos os grupos de 4 sons em "NATUREZA"
                          ],
                          phaseExercises: [
                            SoundExercise(exerciseId: UUID(uuidString: "550e8630-e29b-41d4-a716-446655440105")!,
                                          exerciseName: "Identifique o som",
                                          exerciseDescription: "Qual destes é o som de um Vaca?",
                                          exerciseType: "soundExercise",
                                          exerciseAlternatives: [
                                            Alternative(alternativeId: UUID(uuidString: "550e8640-e29b-41d4-a716-446655440106")!,
                                                        alternativeLabel: "Baleia",
                                                        alternativeSoundName: "BaleiaSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8650-e29b-41d4-a716-446655440107")!,
                                                        alternativeLabel: "Macaco",
                                                        alternativeSoundName: "MacacoSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8660-e29b-41d4-a716-446655440108")!,
                                                        alternativeLabel: "Porco",
                                                        alternativeSoundName: "PorcoSound"),
                                            Alternative(alternativeId: UUID(uuidString: "550e8670-e29b-41d4-a716-446655440109")!,
                                                        alternativeLabel: "Vaca",
                                                        alternativeSoundName: "VacaSound")
                                          ],
                                          exerciseAnswer: 3)
                            //... repita para cada som específico como exercício em "NATUREZA"
                          ])
                ]
               )
        
        // Continue da mesma forma para as seções "URBANO" e "INSTRUMENTOS"
    ], phonemesSection: [Section] = [])
    {
        self.soundsSections = soundsSections
        self.phonemesSection = phonemesSection
    }
    
}
