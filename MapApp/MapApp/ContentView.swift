//
//  ContentView.swift
//  MapApp
//
//  Created by Anna Rosner on 3/15/22.
//

import SwiftUI

struct ContentView: View{
    let geoItems = ["rivers","mountains","lakes"] //TODO: fix this
    @State var selection: Int = 1
    @State var amount:String = "test"
        var body: some View {
            TabView {
            NavigationView{
                List(geoItems, id: \.self){
                    geoItem in NavigationLink(destination: QuizDetailView(feature:geoItem)){Text(geoItem.capitalized)}
                }.navigationBarHidden(true)
                    //.navigationTitle("")
                    .navigationBarTitleDisplayMode(.inline)
            }.tabItem {Image(systemName: "house")}
                Form {
                    Stepper {
                        selection+=1
                        UserDefaults.standard.set(selection, forKey: "numQuest")
                    } onDecrement: {
                        selection-=1
                        UserDefaults.standard.set(selection, forKey: "numQuest")
                    } label: {
                        Text("Select number of questions: \(selection)")
                    }


                }
                
                .tabItem {Image(systemName: "gear")}
            }
    }
}
/*        VStack {
            Image("nile")
                .resizable()
                .aspectRatio(contentMode: .fit)
            ForEach(0..<3) { number in
                Button {
                    print("Tap \(number)")
                } label: {
                    Image("nilemap")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            Spacer()
            HStack{
                Button {
                    print("Restart")
                } label: {
                    Text("Restart")
                }
                Spacer()
                Text("Score: 3")
            }
                
            
            //}
        }.frame(maxWidth: .infinity)
            .padding(.horizontal)
            
        }
  
    } */

struct CardView: View {
    //let card: MemoryGame<>.Card
    var imageName: String
    
    @State private var animatedBonusRemaining: Double = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            //.cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    // the "scale factor" to scale our Text up so that it fits the geometry.size offered to us
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
        
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.7
        static let fontSize: CGFloat = 32
    }
}

/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}*/
