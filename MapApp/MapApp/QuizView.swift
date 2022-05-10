//
//  QuizView.swift
//  MapApp
//
//  Created by Anna Rosner on 3/22/22.
//  ViewModel


import SwiftUI

class QuizView: ObservableObject {
    let featuresDictionary: [String:[String]] = ["rivers": ["nile", "volga", "ohio"]]
    @State var currentFeature: String
    @Published var maxQuestions: Int = UserDefaults.standard.integer(forKey: "numQuest")
    var numQuestsDone = 0
    @Published var presentPopover: Bool = false
        
    typealias Card = GeographyModel<String>.Card
    @Published var model: GeographyModel<String>
    
    func reset() {
        model.updateScore(0)
        numQuestsDone=0
    }
    
    func choose(isCorrect: Bool) {
        model.choose(isCorrect: isCorrect)
        if numQuestsDone < maxQuestions-1 {
            numQuestsDone += 1
        }
        else {
            presentPopover = true
        }
    }
    func getPlace(key: String, index: Int) -> String? {
        let items: [String] = featuresDictionary[key, default:["unknown"]]
        if index < items.count {
            return items[index]
        }
        return nil
    }
    
    func createCardContent(geoItem: String) -> String {
        return geoItem
        }
        
    init(currentFeature: String) {
        self.currentFeature = currentFeature
        model = GeographyModel(featureName: currentFeature) {item in
            return item}
        }
}
    
    
    
    
    
    
    
    /*@State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    var feature: String
     var featureNames: [String]
    @State var correctAnswer = Int.random(in: 0...2)
          
    
    
    
    
    
    
    
    
        var body: some View {
            ZStack {
                RadialGradient(stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
                ], center: .top, startRadius: 200, endRadius: 700)
                    .ignoresSafeArea()

                VStack {
                    Spacer()

                    Text("Guess the Map")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)

                    VStack(spacing: 15) {
                        ZStack {
                            Image(uiImage: cropImage((featureNames[correctAnswer]), 300, 75)).opacity(0.6).blur(radius: 4)
                            //RoundedRectangle(cornerRadius: 20)
                            VStack {
                                Text("Pick the map of")
                                    .foregroundStyle(.secondary)
                                    .font(.subheadline.weight(.heavy))

                                Text("the " + featureNames[correctAnswer].capitalized + feature)
                                    .font(.largeTitle.weight(.semibold))
                            }
                        }

                        ForEach(0..<3) { number in
                            Button {
                                answerTapped(number)
                            } label: {
                                Image(featureNames[number]+"map")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    
                                //CardView(imageName: rivers[number]+"map")
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                    Spacer()

                    HStack {
                        Text("Score: \($score.wrappedValue)")
                            .foregroundColor(.white)
                            .font(.title.bold())
                        //TODO: button
                    }

                    Spacer()
                }
                .padding()
            }
            /*.alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(score)")
            }*/
        }

    func answerTapped(_ number: Int) {
            if number == correctAnswer {
                scoreTitle = "Correct"
                score += 1
            } else {
                scoreTitle = "Wrong"
            }
        askQuestion()
            
        }

    func askQuestion() {
            featureNames.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }*/

