//
//  FonemaLessonView.swift
//  Soundfy
//
//  Created by Rafael Carreira on 03/10/23.
//

import SwiftUI

struct FonemaLessonView: View {
    
    @EnvironmentObject var profileController: ProfileController
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var lesson: Lesson
    var changeScreen: () -> Void
    var count: Int
    @Binding var buttonText: String
    let bocas: [String] = [
        "AHK", //0
        "BMP", //1
        "C", //2
        "DQT", //3
        "E", //4
        "FV", //5
        "GW", //6
        "IY", //7
        "JX",//8
        "LN",//9
        "O",//10
        "R",//11
        "SZ",//12
        "U"]//13
    @State var boca: String = "AE"
    @State var index: Int = 0
    @State var isTalking: Bool = true
    @State var contador = 0
    @State var palavraescrita: String = "BOBOCA"
    var palavraindex: [Int] = []
    @State var imageSwitchTimer = Timer.publish(every: 0.4, on: .main, in: .common).autoconnect()
    
    var transition: AnyTransition {
        switch index {
        case 0:
            return .asymmetric(insertion: .scale, removal: .opacity)
        default:
            return .identity
        }
    }
    
    func palavra(letras: String) -> [Int]{
        var aux: [String] = []
        aux = letras.map({ letter in String(letter) })
        var lista: [Int] = []
        for i in aux{
            switch i{
            case "A":
                lista.append(0)
            case "B":
                lista.append(1)
            case "C":
                lista.append(2)
            case "D":
                lista.append(3)
            case "E":
                lista.append(4)
            case "F":
                lista.append(5)
            case "G":
                lista.append(6)
            case "H":
                lista.append(0)
            case "I":
                lista.append(7)
            case "J":
                lista.append(8)
            case "K":
                lista.append(0)
            case "L":
                lista.append(9)
            case "M":
                lista.append(1)
            case "N":
                lista.append(9)
            case "O":
                lista.append(10)
            case "P":
                lista.append(1)
            case "Q":
                lista.append(3)
            case "R":
                lista.append(11)
            case "S":
                lista.append(12)
            case "T":
                lista.append(3)
            case "U":
                lista.append(13)
            case "V":
                lista.append(5)
            case "W":
                lista.append(6)
            case "X":
                lista.append(8)
            case "Y":
                lista.append(7)
            case "Z":
                lista.append(12)
                
            default:
                print("Sem boca pra essa letra")
            }
        }
        
        
        return lista
    }
    var body: some View {
        VStack {
            
            // ===== BODY =====
            Spacer()
            VStack (spacing: 20) {
                Text("Fonema")
                    .font(Font.custom("Quicksand-Bold", size: 40, relativeTo: .largeTitle))
                    .bold()
                
                Text("Clique nas vogais para descobrir as pronúncias")
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding(.horizontal)
                
                
                ZStack{
                    if isTalking {
                        
                        Image("Sapo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 370)
                        Image(bocas[palavra(letras: palavraescrita)[index]])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaledToFit()
                            .frame(width: 100, height: 60)
                            .padding(.bottom)
                            .transition(transition) // use here
                            .onReceive(imageSwitchTimer) { _ in
                                let aux = self.palavra(letras: palavraescrita).count
                                
                                self.index = (self.index + 1) % self.palavra(letras: palavraescrita).count
                                
                                contador += 1
                                
                                if contador == aux {
                                    self.imageSwitchTimer.upstream.connect().cancel()
                                    isTalking.toggle()
                                }
                            }
                    }
                    else{
                        Image("AHK")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 60)
                        
                        
                    }
                }
                
                
                
                LazyVGrid(columns: columns, spacing: 20) {
                    if let soundLesson = profileController.actualPhase.phaseLessons[count] as? SoundLesson {
                        ForEach(soundLesson.lessonAlternatives, id: \.alternativeId) { item in
                            AlternativeButton(item: item)
                                .onTapGesture{
                                    palavraescrita = item.alternativeLabel
                                    isTalking.toggle()
                                    imageSwitchTimer = Timer.publish(every: 0.4, on: .main, in: .common).autoconnect()
                                    contador = 0
                                }
                        }
                    }
                }
            }
            
            // ===== FOOTER =====
            Spacer()
            Spacer()
            Spacer()
            PlayButton(buttonAction: {changeScreen()}, buttonText: buttonText)
        }
        .padding(.horizontal, 30)
        .multilineTextAlignment(.center)
        .foregroundColor(Color(red: 56/255, green: 128/255, blue: 200/255))
    }
}
