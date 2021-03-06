//
//  ContentView.swift
//  Edutainment
//
//  Created by Tyler Brown on 2/9/21.
//

import SwiftUI

struct Question {
    var text: String
    var answer : Int
}

extension Text {
    func mainText() -> Text {
        self
            .foregroundColor(.white)
            .font(.title)
            .fontWeight(.bold)
    }
}

struct AnswerButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 300, height: 100, alignment: .center)
            .foregroundColor(.white)
            .font(.title)
            .background(Color.gray)
            .foregroundColor(Color.white)
            .clipShape(Capsule())
            .padding(3)
        
    }
}
extension View {
    func drawAnswerButton() -> some View {
        self.modifier(AnswerButton())
    }
}

struct StartEndButton: ViewModifier {
    var whatColor: Bool
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(whatColor ? Color.red : Color.green)
        
    }
}
extension View {
    func drawStartEndButton(whatColor: Bool) -> some View {
        self.modifier(StartEndButton(whatColor: whatColor))
    }
}


struct ContentView: View {
    
    @State private var gameIsRunning = false
    @State private var tables = 1
    @State private var numberOfQuestions = 0
    @State private var randomMultiplicationNumber = Int.random(in: 1...12)
    @State private var numberOfQuestion = ["5", "10", "15", "20"]
    @State private var currentQuestion = 1
    @State private var score = 0
    @State private var scoreTitle = ""
    @State private var showingScore = false
    @State private var endAlert = false
    @State private var textColor = false
    @State private var endGame = false
    
    
    @State private var randomNumber1 = Int.random(in: 0...144)
    @State private var randomNumber2 = Int.random(in: 0...144)
    @State private var randomNumber3 = Int.random(in: 0...144)
    
    @State private var questionOrder = Int.random(in: 0...3)
    
    
    var body: some View {
        
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Edutainment!")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                if gameIsRunning {
                    
                    Form {
                        Section{
                            Text("What is \(randomMultiplicationNumber)*\(tables)?")
                        }
                    }
                    if questionOrder == 0 {
                        
                        
                        
                        Button(action: {
                            self.checkAnswer(getAnswer())
                            self.nextQuestion()
                            self.checkRound()
                        }) {
                            Text("\(getAnswer())")
                        }
                        .drawAnswerButton()
                        Button(action: {
                            self.checkAnswer(randomNumber1)
                            self.nextQuestion()
                            self.checkRound()
                        }) {
                            Text("\(randomNumber1)")
                        }
                        .drawAnswerButton()
                        Button(action: {
                            self.checkAnswer(randomNumber2)
                            self.nextQuestion()
                            self.checkRound()
                        }) {
                            Text("\(randomNumber2)")
                        }
                        .drawAnswerButton()
                        Button(action: {
                            self.checkAnswer(randomNumber3)
                            self.nextQuestion()
                            self.checkRound()
                        }) {
                            Text("\(randomNumber3)")
                        }
                        .drawAnswerButton()
                        
                    } else if questionOrder == 1 {
                        
                        Button(action: {
                            self.checkAnswer(randomNumber1)
                            self.nextQuestion()
                            self.checkRound()
                        }) {
                            Text("\(randomNumber1)")
                        }
                        .drawAnswerButton()
                        Button(action: {
                            self.checkAnswer(getAnswer())
                            self.nextQuestion()
                            self.checkRound()
                        }) {
                            Text("\(getAnswer())")
                        }
                        .drawAnswerButton()
                        Button(action: {
                            self.checkAnswer(randomNumber2)
                            self.nextQuestion()
                            self.checkRound()
                        }) {
                            Text("\(randomNumber2)")
                        }
                        .drawAnswerButton()
                        Button(action: {
                            self.checkAnswer(randomNumber3)
                            self.nextQuestion()
                            self.checkRound()
                        }) {
                            Text("\(randomNumber3)")
                        }
                        .drawAnswerButton()
                        
                        
                        
                    } else if questionOrder == 2 {
                        
                        
                        
                        Button(action: {
                            self.checkAnswer(randomNumber1)
                            self.nextQuestion()
                            self.checkRound()
                        }) {
                            Text("\(randomNumber1)")
                        }
                        .drawAnswerButton()
                        Button(action: {
                            self.checkAnswer(randomNumber2)
                            self.nextQuestion()
                            self.checkRound()
                        }) {
                            Text("\(randomNumber2)")
                        }
                        .drawAnswerButton()
                        Button(action: {
                            self.checkAnswer(getAnswer())
                            self.nextQuestion()
                            self.checkRound()
                        }) {
                            Text("\(getAnswer())")
                        }
                        .drawAnswerButton()
                        Button(action: {
                            self.checkAnswer(randomNumber3)
                            self.nextQuestion()
                            self.checkRound()
                        }) {
                            Text("\(randomNumber3)")
                        }
                        .drawAnswerButton()
                        
                        
                    } else if questionOrder == 3 {
                        
                        
                        Button(action: {
                            self.checkAnswer(randomNumber1)
                            self.nextQuestion()
                            self.checkRound()
                        }) {
                            Text("\(randomNumber1)")
                        }
                        .drawAnswerButton()
                        Button(action: {
                            self.checkAnswer(randomNumber2)
                            self.nextQuestion()
                            self.checkRound()
                        }) {
                            Text("\(randomNumber2)")
                        }
                        .drawAnswerButton()
                        Button(action: {
                            self.checkAnswer(randomNumber3)
                            self.nextQuestion()
                            self.checkRound()
                        }) {
                            Text("\(randomNumber3)")
                        }
                        .drawAnswerButton()
                        Button(action: {
                            self.checkAnswer(getAnswer())
                            self.nextQuestion()
                            self.checkRound()
                        }) {
                            Text("\(getAnswer())")
                        }
                        .drawAnswerButton()
                    }
                    
                    
                    HStack {
                        Text("Question \(currentQuestion)/\(self.numberOfQuestionsss()) ")
                            .mainText()
                        Text("Score: \(score) ")
                            .mainText()
                    }
                    
                    Text("\(scoreTitle)")
                        .foregroundColor(textColor ? Color.green : Color.red)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Button(action: {
                        self.gameIsRunning.toggle()
                        
                        
                    }) {
                        Text("End game")
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .drawStartEndButton(whatColor: true)
                    }
                    
                } else {
                    
                    
                    Form {
                        
                        Section(header: Text("Which multiplication table would you like to do?")) {
                            Stepper(value: $tables, in: 1...12, step: 1) {
                                Text("\(tables)'s")
                            }
                        }
                        
                        Section(header: Text("How many questions do you want?")) {
                            Picker("", selection: $numberOfQuestions) {
                                ForEach(0..<numberOfQuestion.count) {
                                    Text("\(self.numberOfQuestion[$0])")
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                    }
                    
                    Button(action: {
                        self.gameIsRunning.toggle()
                        
                    }) {
                        
                        Text("Start game")
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .drawStartEndButton(whatColor: false)
                    }
                }
            }
        }
        
        .alert(isPresented: $endAlert) {
            Alert(title: Text(endGame ? "Good job you got 100%!" : "Practice again to get to 100%"), message: Text("Your final score was \(score)/\(numberOfQuestionsss())"), dismissButton: .default(Text("New game")){
                self.newGame()
            })
        }
    }
    
    func getAnswer() -> Int {
        let answer = randomMultiplicationNumber * tables
        return answer
    }
    
    func nextQuestion() {
        randomMultiplicationNumber = Int.random(in: 1...12)
        currentQuestion += 1
        showingScore = false
        questionOrder = Int.random(in: 0...3)
    }
    
    func numberOfQuestionsss() -> Int {
        var number: Int
        if numberOfQuestions == 0 {
            number = 5
        } else if numberOfQuestions == 1 {
            number = 10
        } else if numberOfQuestions == 2 {
            number = 15
        } else {
            number = 20
        }
        return number
    }
    
    
    func checkAnswer(_ number: Int) {
        if number == getAnswer() {
            scoreTitle = "Correct!"
            score += 1
            textColor = true
        } else {
            scoreTitle = "Incorrect"
            textColor = false
        }
        showingScore = true
    }
    
    func checkRound() {
        if currentQuestion == numberOfQuestionsss() {
            if score == numberOfQuestionsss() {
                endGame = true
            } else {
                endGame = false
            }
            endAlert = true
        }
    }
    
    func newGame() {
        gameIsRunning = false
        score = 0
        scoreTitle = ""
        currentQuestion = 0
        questionOrder = Int.random(in: 0...3)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
