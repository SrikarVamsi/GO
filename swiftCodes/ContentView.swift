import SwiftUI

struct ContentView: View {
    @State private var showWelcome = false  // State to track if we show the welcome message
    
    var body: some View {
        NavigationView {
            ZStack {
                // Load image from the file system
                if let imagePath = Bundle.main.path(forResource: "login_bg", ofType: "jpeg"),
                   let uiImage = UIImage(contentsOfFile: imagePath) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all) // Ensures the image covers the entire screen
                } else {
                    Color.black // Fallback background if the image is not found
                        .edgesIgnoringSafeArea(.all)
                }

                if showWelcome {
                    // Show welcome message and buttons after the GIF
                    VStack(spacing: 40) {
                        // App name and tagline to fill empty space
                        VStack(spacing: 10) {
                            Text("GO")  // App name
                                .font(.system(size: 50, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                                .shadow(radius: 5)
                            
                            Text("Hangout, your way")  // Tagline
                                .font(.title3)
                                .foregroundColor(.white)
                                .italic()
                        }
                        .padding(.top, 40)  // Adjust top padding to move up content

                        Text("Welcome to GO!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .shadow(radius: 5)

                        // Sign In Button
                        NavigationLink(destination: LoginPage()) {
                            Text("Sign In")
                                .fontWeight(.bold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .foregroundColor(Color(hex: "#fd4b4b"))
                                .cornerRadius(10)
                                .shadow(radius: 10)
                                .padding(.horizontal, 30)
                        }

                        // Continue as Guest Button
                        NavigationLink(destination: DashboardView()) {
                            Text("Continue as Guest")
                                .fontWeight(.bold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .foregroundColor(Color(hex: "#f04849"))
                                .cornerRadius(10)
                                .shadow(radius: 10)
                                .padding(.horizontal, 30)
                        }
                    }
                    .padding(.top, 50)  // Adjust padding to move the content upwards
                } else {
                    // Show the GIF and the cool text
                    VStack {
                        Spacer()
                        
                        // Increase the GIF size to fill more space and remove the white gap
                        GifImage("intro_again")
                            .frame(width: 500, height: 330)  // Adjust the size of the GIF as needed

                        // Text Below the GIF
                        Text("Let's GO!")  // Cool text to match your app theme
                            .font(.system(size: 34, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.top, 20)

                        Spacer()
                    }
                }
            }
            .onAppear {
                // Delay of 3 seconds before showing the welcome message
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                    withAnimation {
                        showWelcome = true
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

