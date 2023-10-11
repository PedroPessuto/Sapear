//
//  FrogTalking.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 10/10/23.
//

import SwiftUI

struct FrogTalking: View {
    
    var playSound: (String) -> Void
    var getSound: (() -> String)?

    @Binding var palavraescrita: String
    var isDisabled: Bool
    @Binding var isTalking: Bool
    var type: String
    
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
        "U"//13
    ]
    
    @State var boca: String = "AE"
    @State var index: Int = 0
   
    @State var contador = 0
    
    var palavraindex: [Int] = []
    @State var imageSwitchTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
        aux = letras.uppercased().map({ letter in String(letter) })
        var lista: [Int] = []
        for i in aux {
            switch i {
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
        ZStack{
            Image("SapoExercise")
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 200)
            
            if isTalking {
                VStack{
                    Image(bocas[palavra(letras: palavraescrita)[index]])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaledToFit()
                        .frame(width: 60, height: 20)
                        .transition(transition)
                        .onReceive(imageSwitchTimer) { _ in
                            let aux = self.palavra(letras: palavraescrita).count
                            
                            self.index = (self.index + 1) % self.palavra(letras: palavraescrita).count
                            print(self.index)
                            print(palavraescrita)
                            contador += 1
                            
                            if contador == aux {
                                self.imageSwitchTimer.upstream.connect().cancel()
                                isTalking.toggle()
                            }
                        }
                }
            }
            else {
                VStack{
                    Image("BMP")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaledToFit()
                        .transition(transition)
                        .frame(width: 60, height: 20)
                    
                }
            }
        }
        .onChange(of: isTalking, perform: { newValue in
            
            if newValue == false {
                contador = 0
                index = 0
                imageSwitchTimer = Timer.publish(every: type == "phonemeClass"  || type == "phonemeExercise"  ? 3 : 1, on: .main, in: .common).autoconnect()
                isTalking = false
            } else {
                isTalking = true
            }
            
        })
        .onTapGesture {
           
            if !isDisabled {
                if let sound = getSound?() {
                    playSound(sound)
                    palavraescrita = sound
                }
                isTalking.toggle()
                
                contador = 0
                index = 0
                imageSwitchTimer = Timer.publish(every: type == "phonemeClass" || type == "phonemeExercise" ? 3 : 0.5, on: .main, in: .common).autoconnect()
            }
        }
    }
}
