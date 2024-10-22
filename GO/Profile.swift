import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            // Load image from the file system
            if let imagePath = Bundle.main.path(forResource: "profile", ofType: "jpeg"),
               let uiImage = UIImage(contentsOfFile: imagePath) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)  // Ensure the image fills the entire screen
            } else {
                Color.black // Fallback background color in case the image is not found
                    .edgesIgnoringSafeArea(.all)
            }

            // Semi-transparent overlay to make text stand out
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                // Profile Image (circle shape)
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.white)
                    .background(Color.white.opacity(0.2))
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .padding(.top, 100)  // Adjust padding for spacing

                // User's Name
                Text("John Doe")
                    .font(.system(size: 35, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .shadow(radius: 5)

                // Bio/Description
                Text("iOS Developer | Tech Enthusiast | Coffee Lover")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.horizontal, 20)
                    .multilineTextAlignment(.center)
                    .shadow(radius: 5)  // Ensure text visibility against the background

                // User Details (Email, Phone, etc.)
                VStack(spacing: 15) {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.white)
                        Text("john.doe@example.com")
                            .foregroundColor(.white)
                    }
                    HStack {
                        Image(systemName: "phone.fill")
                            .foregroundColor(.white)
                        Text("+1 (555) 123-4567")
                            .foregroundColor(.white)
                    }
                    HStack {
                        Image(systemName: "house.fill")
                            .foregroundColor(.white)
                        Text("123 Main St, Springfield")
                            .foregroundColor(.white)
                    }
                }
                .font(.system(size: 20))
                .padding(.top, 30)

                Spacer()

                // Edit Profile Button
                Button(action: {
                    // Action to edit profile
                }) {
                    Text("Edit Profile")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                        .shadow(radius: 10)
                }
                .padding(.bottom, 40)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

