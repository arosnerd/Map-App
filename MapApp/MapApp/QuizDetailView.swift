//
//  Rivers.swift
//  MapApp
//
//  Created by Anna Rosner on 3/15/22.
//

import SwiftUI

struct QuizDetailView: View {
    @State var feature:String
    @ObservedObject var viewModel: QuizView
    //@State var presentPopover: Bool = false
    
    init (feature: String) {
        self.feature = feature
        viewModel = QuizView(currentFeature: feature)
    }
    @State private var showingScore = false
    //@State private var score = 0
    
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
                        if let imageName = viewModel.getPlace(key: feature, index: correctAnswer) {
                            Image(uiImage: cropImage((imageName), 300, 75)).opacity(0.6).blur(radius: 4)
                        //RoundedRectangle(cornerRadius: 20)
                        VStack {
                            Text("Pick the map of")
                                .foregroundStyle(.secondary)
                                .font(.subheadline.weight(.heavy))

                            
                            Text("The " + imageName.capitalized + " " + formatText())
                                .font(.largeTitle.weight(.semibold))
                        }
                    }
                    }

                    ForEach(0..<3) { number in
                        Button {
                            riverTapped(number)
                        } label: {
                            if let imageName = viewModel.getPlace(key: feature, index: number) {
                                Image(imageName + "map")
                                    .resizable()
                                    .scaledToFill()
                                
                            //CardView(imageName: rivers[number]+"map")
                            }
                    }.frame(maxHeight:100)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))

                Spacer()

                HStack {
                    Text("Score: \(viewModel.model.getScore())")
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
            
        }.popover(isPresented: $viewModel.presentPopover) {
            VStack {
                Text("score: \(viewModel.model.getScore()) / \(viewModel.maxQuestions)")
                Spacer()
                Button(action: {viewModel.presentPopover = false
                    viewModel.reset()
                }) {
                    Text("okay")
                }
            }.padding(50)
        }
                
        }//end body
    func riverTapped(_ number: Int) {
        viewModel.choose(isCorrect: (number==correctAnswer))
        askQuestion()
            
        }

        func askQuestion() {
            //rivers.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
    func formatText() -> String {
        var f = feature.capitalized
        f = String(f.dropLast())
        return f
    }

}
struct Rivers_Previews: PreviewProvider {
    static var previews: some View {
        QuizDetailView(feature: "rivers")
    }
}
/*struct Mountain_Previews: PreviewProvider {
    static var previews: some View {
        QuizDetailView(feature: "mountains")
    }
}*/
