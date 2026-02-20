import SwiftUI

struct LevelBonusView: View {
    
    @State private var remainingQuestions: [String] = []
    @State private var currentQuestion: String = ""
    @State private var questionNumber: Int = 0
    @State private var opacity: Double = 1
    
    let questions = [
        "Imagine que a gente está em um filme: qual seria a trilha sonora dessa cena?",
        "Se tivesse que me dar um apelido agora, qual seria?",
        "Me conta um segredo aleatório sobre você.",
        "Se eu fosse um personagem de desenho/filme, quem eu seria?",
        "Se pudesse escrever uma carta para si mesmo daqui a 5 anos, o que colocaria?",
        "Conte algo que faria agora se não houvesse nenhuma consequência.",
        "Qual a lembrança mais engraçada que você tem guardada?",
        "Se tivesse que compartilhar uma playlist comigo, quais 3 músicas não poderiam faltar?",
        "Inventa uma pergunta que você sempre quis fazer a alguém, mas nunca teve coragem.",
        "Se a gente fosse viajar juntos, para onde escolheria ir?",
        "Qual emoji você usaria para resumir essa conversa?",
        "Se pudesse trocar de vida comigo por um dia, o que faria?",
        "Crie uma história curta começando com: “Uma vez, no meio da madrugada...”",
        "Qual foi o momento mais “vergonha alheia” que já passou?",
        "Se tivesse que fazer um brinde agora, brindaria a quê?"
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
