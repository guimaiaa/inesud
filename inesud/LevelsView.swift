import SwiftUI

struct LevelsView: View {
    var body: some View {
        ZStack {
            
            // Fundo off-white com toque vermelho
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.99, green: 0.96, blue: 0.93),
                    Color(red: 0.93, green: 0.72, blue: 0.68)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 30) {
                    
                    Text("Escolha o Nível")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(Color(red: 0.32, green: 0.26, blue: 0.22))
                    
                    VStack(spacing: 20) {
                        
                        NavigationLink(destination: LevelOneView()) {
                            Text("Nível 1 - Quebra-gelo")
                        }
                        .buttonStyle(LevelButtonStyle())
                        
                        NavigationLink(destination: LevelTwoView()) {
                            Text("Nível 2 - Conhecendo melhor")
                        }
                        .buttonStyle(LevelButtonStyle())
                        
                        NavigationLink(destination: LevelThreeView()) {
                            Text("Nível 3 - Mais profundo")
                        }
                        .buttonStyle(LevelButtonStyle())
                        
                        NavigationLink(destination: LevelBonusView()) {
                            Text("Nível Bônus - Criativos e desafiadores")
                        }
                        .buttonStyle(LevelButtonStyle())
                    }
                }
                
                Spacer()
                
            }
            .padding(.horizontal, 30)
            .offset(y: -24)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LevelButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(configuration.isPressed ? 0.8 : 0.65))
            .foregroundColor(.black)
            .cornerRadius(18)
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}
