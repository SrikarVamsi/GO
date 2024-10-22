import SwiftUI

struct LoginPage: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""

    var body: some View {
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

            VStack(spacing: 20) {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)  // Text stands out against the background
                    .shadow(radius: 5)
                
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.white.opacity(0.2))  // Slightly transparent for a modern look
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.subheadline)
                }

                // Animated Login Button
                NavigationLink(destination: DashboardView()) {
                    Text("Login")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)  // Complementing the background
                        .foregroundColor(.white)   // Ensuring text contrast
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding(.top, 20)
                }

                HStack {
                    Button(action: {}) {
                        Text("Login with Google")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)  // White background for contrast
                            .foregroundColor(.red)    // Google Red
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }

                    Button(action: {}) {
                        Text("Login with Facebook")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)  // Facebook Blue
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
                .padding(.top, 20)
            }
            .padding()
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}

