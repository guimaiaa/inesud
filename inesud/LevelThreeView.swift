import SwiftUI

struct LevelThreeView: View {
    
    @State private var remainingQuestions: [String] = []
    @State private var currentQuestion: String = ""
    @State private var questionNumber: Int = 0
    @State private var opacity: Double = 1
    
    let questions = [
        "Qual é a sua maior insegurança?",
        "Existe algo que você nunca contou para ninguém?",
        "Quando foi a última vez que você chorou?",
        "O que mais te assusta no futuro?",
        "Qual parte da sua história pessoal você mais tem orgulho?",
        "Existe algum arrependimento que ainda pesa?",
        "O que você acha que as pessoas mais subestimam em você?",
        "Qual foi o maior risco que já correu?",
        "Você acha fácil ou difícil confiar nos outros?",
        "Qual foi a vez que mais se sentiu sozinho(a)?",
        "O que você gostaria que as pessoas entendessem melhor sobre você?",
        "Você já se apaixonou sem ser correspondido(a)?",
        "Existe algo que você sente que precisa perdoar (ou ser perdoado)?",
        "Qual é a lembrança mais nítida da sua infância?",
        "Se pudesse reviver um dia da sua vida, qual seria?",
        "O que você faria diferente se ninguém fosse te julgar?",
        "Qual foi a conversa mais importante que já teve?",
        "O que te faz sentir vulnerável?",
        "Qual é o maior sonho que você ainda guarda?",
        "O que significa amor para você?"
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
