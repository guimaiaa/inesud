import SwiftUI

struct LevelOneView: View {
    
    @State private var remainingQuestions: [String] = []
    @State private var currentQuestion: String = ""
    @State private var questionNumber: Int = 0
    @State private var opacity: Double = 1
    
    let questions = [
        "Qual foi a última coisa que te fez rir de verdade?",
        "Você prefere doce ou salgado?",
        "Se pudesse escolher um superpoder, qual seria?",
        "Qual foi o último filme ou série que te prendeu de verdade?",
        "Qual comida te lembra infância?",
        "Prefere praia ou montanha?",
        "Qual música você tem escutado sem parar ultimamente?",
        "Você é mais do dia ou da noite?",
        "Qual aplicativo você mais usa no celular?",
        "Se pudesse ter um animal de estimação exótico, qual seria?",
        "Qual foi a coisa mais inesperada que já aconteceu com você essa semana?",
        "Você gosta mais de planejar ou de improvisar?",
        "Se fosse uma cor hoje, qual seria?",
        "Qual emoji você mais usa?",
        "Chá, café ou nenhum dos dois?"
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.99, green: 0.97, blue: 0.94),
                    Color(red: 0.95, green: 0.92, blue: 0.88)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                
                Text("\(questionNumber) / \(questions.count)")
                    .font(.headline)
                    .foregroundColor(Color(red: 0.32, green: 0.26, blue: 0.22))
                
                Text(currentQuestion)
                    .foregroundColor(Color(red: 0.2, green: 0.17, blue: 0.15))
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 330, height: 220)
                    .opacity(opacity)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                
                Button(action: {
                    nextQuestion()
                }) {
                    Text("Próxima Pergunta")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 200)
                        .background(Color.white)
                        .cornerRadius(15)
                }
            }
            .offset(y: -24)
        }
        .onAppear {
            startGame()
        }
    }
    
    func startGame() {
        remainingQuestions = questions.shuffled()
        currentQuestion = remainingQuestions.removeFirst()
        questionNumber = 1
    }
    
    func nextQuestion() {
        guard !remainingQuestions.isEmpty else { return }
        
        // Fade out
        withAnimation(.easeOut(duration: 0.3)) {
            opacity = 0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
            currentQuestion = remainingQuestions.removeFirst()
            questionNumber += 1
            
            // Fade in
            withAnimation(.easeIn(duration: 0.3)) {
                opacity = 1
            }
        }
    }
}
