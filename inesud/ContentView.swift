import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
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
                
                VStack(spacing: 25) {
                    
                    Text("\(Text("Isso ").foregroundColor(Color(red: 0.32, green: 0.26, blue: 0.22)))\(Text("não").foregroundColor(Color(red: 0.82, green: 0.2, blue: 0.2)))\(Text(" é (só) um date").foregroundColor(Color(red: 0.32, green: 0.26, blue: 0.22)))")
                        .font(.system(size: 36, weight: .bold))
                        .multilineTextAlignment(.center)
                    .font(.system(size: 36, weight: .bold))
                    .multilineTextAlignment(.center)
                    
                    Text("Descubra conexões de forma divertida")
                        .foregroundColor(Color(red: 0.32, green: 0.26, blue: 0.22).opacity(0.8))
                        .multilineTextAlignment(.center)
                    
                    NavigationLink(destination: LevelsView()) {
                        Text("Começar")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: 200)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(15)
                            .shadow(radius: 10)
                    }
                }
                .padding()
            }
        }
    }
}
