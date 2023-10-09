//
//  SoundExerciseView.swift
//  Soundfy
//
//  Created by Pedro Pessuto on 29/09/23.
//

import SwiftUI
import AVFoundation


struct SoundExerciseView: View {
    
    @EnvironmentObject var profileController: ProfileController
    var exercise: Exercise
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var count: Int
    var changeScreen: () -> Void
    
    @State var exerciseAwnser: Int = -1
    @State var buttonText: String = "Confirmar"
    @State var gotRight: Bool = false
    @State var selectedOption: Int = -1
    @State var waringText: String = ""
    @State var clickedAlternatives: [UUID] = []
    @State var selectedOptionId: UUID = UUID()
    
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
    @State var palavraescrita: String = "B"
    var palavraindex: [Int] = []
    @State var imageSwitchTimer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    
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
    func playSound(Nome: String){
        let url = Bundle.main.url(forResource: Nome, withExtension: "mp3")
        guard url != nil else{
            return
        }
        do{
            player = try AVAudioPlayer(contentsOf: url!)
            player?.play()
        }catch{
            print("\(error)")
        }
    }
    
    func getSound() -> String{
        if let soundExercise = profileController.actualPhase!.phaseExercises[count] as? SoundExercise {
            return ExerciseSoundButton(item: soundExercise.exerciseAlternatives[soundExercise.exerciseAnswer], exerciseAnswer: soundExercise.exerciseAnswer, number: soundExercise.exerciseAnswer, buttonAction: {}, selectedOption: $selectedOption,selectedOptionId: $selectedOptionId, clickedAlternatives: $clickedAlternatives).item.alternativeSoundName
        }
        return ""
        
    }
    
    func handleNextScreen() {
        // Funcionamento de próxima tela
        
        
        // Se já acertou prox tela
        if gotRight {
            changeScreen()
            buttonText = "Confirmar"
            gotRight = false
            selectedOption = -1
            waringText = ""
            clickedAlternatives = []
            selectedOptionId = UUID()
        }
        
        // Verifica se acertou
        if selectedOption == exerciseAwnser {
            
            gotRight = true
            waringText = "Parabéns"
            buttonText = "Próximo"
            
        }
        
        // Verifica se errou
        if selectedOption != exerciseAwnser && selectedOption != -1 {
            waringText = "Tente Novamente"
        }
        
        if !clickedAlternatives.contains(selectedOptionId) {
            clickedAlternatives.append(selectedOptionId)
        }
        
    }
    
    var body: some View {
        VStack {
            
            // ===== BODY =====
            Spacer()
            VStack (spacing: 20) {
                Text(exercise.exerciseName)
                    .font(Font.custom("Quicksand-Bold", size: 38,relativeTo: .largeTitle))
                    .multilineTextAlignment(.center)
                    .bold()
                
                Text(exercise.exerciseDescription)
                    .font(.title2)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                if exercise.exerciseType == "soundExercise" {
                    SoundButton(buttonAction: {playSound(Nome: getSound())})
                }else {
                    ZStack{
                        Image("SapoExercise")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130, height: 250)
                        
                        if isTalking {
                            VStack{
                                Image(bocas[palavra(letras: palavraescrita)[index]])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaledToFit()
                                    .frame(width: 60, height: 20)
                                    .transition(transition) // use here
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
                        else{
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
                    .onTapGesture {
                        playSound(Nome: getSound())
                        palavraescrita = getSound()
                        isTalking.toggle()
                        contador = 0
                        index = 0
                        imageSwitchTimer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
                    }
                }
                
                LazyVGrid(columns: columns, spacing: 20) {
                    if let soundExercise = profileController.actualPhase!.phaseExercises[count] as? SoundExercise {
                        ForEach(soundExercise.exerciseAlternatives.indices, id: \.self) { item in
                            ExerciseSoundButton(item: soundExercise.exerciseAlternatives[item], exerciseAnswer: soundExercise.exerciseAnswer, number: item, buttonAction: {playSound(Nome: soundExercise.exerciseAlternatives[item].alternativeSoundName)}, selectedOption: $selectedOption, selectedOptionId: $selectedOptionId, clickedAlternatives: $clickedAlternatives)
                            
                            
                        }
                    }
                }
            }
            
            // ===== FOOTER =====
            Spacer()
            Spacer()
            Spacer()
            Text(waringText)
                .frame(height: 15)
                .padding(.bottom)
            PlayButton(buttonAction: {handleNextScreen()}, buttonText: buttonText)
        }
        .onAppear {
            if let soundExercise = profileController.actualPhase!.phaseExercises[count] as? SoundExercise {
                exerciseAwnser = soundExercise.exerciseAnswer
            }
        }
        .onChange(of: count, perform: { newValue in
            if let soundExercise = profileController.actualPhase!.phaseExercises[count+1] as? SoundExercise {
                exerciseAwnser = soundExercise.exerciseAnswer
            }
        })
        .padding(.horizontal, 30)
        .multilineTextAlignment(.center)
        .foregroundColor(Color(red: 56/255, green: 128/255, blue: 200/255))
    }
}
