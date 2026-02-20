import SwiftUI

struct LevelTwoView: View {
    
    @State private var remainingQuestions: [String] = []
    @State private var currentQuestion: String = ""
    @State private var questionNumber: Int = 0
    @State private var opacity: Double = 1
    
    let questions = [
        "O que você mais valoriza em uma amizade?",
        "Qual foi um momento da sua vida que te marcou muito?",
        "Qual hábito pequeno deixa seu dia melhor?",
        "O que você faz quando está nervoso(a)?",
        "Qual foi o presente mais especial que já recebeu?",
        "Quem é uma pessoa que você admira muito?",
        "Qual livro/filme mudou sua forma de pensar sobre algo?",
        "Se pudesse mudar uma decisão do passado, mudaria?",
        "O que não pode faltar na sua rotina?",
        "Já teve alguma experiência que parecia ruim, mas depois fez sentido?",
        "Qual foi a viagem mais marcante que você já fez?",
        "Se fosse escolher um cheiro para descrever sua vida, qual seria?",
        "Você acredita em coincidências ou acha que tudo tem um motivo?",
        "Qual é a sua memória favorita dos últimos meses?",
        "Que conselho você daria para o “você” de 10 anos atrás?",
        "Prefere estar no controle ou deixar fluir?",
        "O que você aprendeu recentemente sobre si mesmo(a)?",
        "Qual foi a última vez que saiu da sua zona de conforto?",
        "O que te dá mais sensação de paz?",
        "Você costuma sonhar muito? Qual foi o último sonho que lembra?"
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
        
        withAnimation(.easeOut(duration: 0.3)) {
            opacity = 0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            currentQuestion = remainingQuestions.removeFirst()
            questionNumber += 1
            
            withAnimation(.easeIn(duration: 0.3)) {
                opacity = 1
            }
        }
    }
}
