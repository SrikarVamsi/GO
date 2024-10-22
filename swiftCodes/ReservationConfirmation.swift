import SwiftUI

struct StarView: View {
    @State private var animate = false
    
    var body: some View {
        ZStack {
            ForEach(0..<15, id: \.self) { _ in
                Circle()
                    .fill(Color.white.opacity(0.6))
                    .frame(width: CGFloat.random(in: 5...10), height: CGFloat.random(in: 5...10))
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: animate ? CGFloat.random(in: 0...UIScreen.main.bounds.height) : 0
                    )
                    .animation(
                        Animation.easeInOut(duration: 4)
                            .repeatForever(autoreverses: false)
                            .delay(Double.random(in: 0...2))
                    )
            }
        }
        .onAppear {
            self.animate.toggle()
        }
    }
}

struct ConfirmationView: View {
    var body: some View {
        NavigationView {  // Added NavigationView to allow NavigationLink to work
            ZStack {
                // Dynamic background with stars
                LinearGradient(
                    gradient: Gradient(colors: [Color.orange, Color.red, Color.yellow]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
                
                StarView()
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    Text("Reservation Confirmed!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                        .transition(.opacity)
                        .animation(.easeInOut)
                    
                    Text("Details have been sent to your email.")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 100))
                        .foregroundColor(.yellow)
                    
                    Spacer()
                    
                    // Return to Dashboard Button
                    NavigationLink(destination: DashboardView()) {
                        Text("Return to Dashboard")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.yellow)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .transition(.opacity)
                            .animation(.easeInOut)
                    }
                    .padding(.horizontal)
                }
                .padding()
            }
        }
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView()
    }
}

