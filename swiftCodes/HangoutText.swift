//
//  HangoutText.swift
//  Try
//
//  Created by Srikar Vamsi on 22/10/24.
//

import SwiftUI

struct HangoutView: View {
    // Dummy data for chats and updates
    @State private var chats = ["Alice", "Bob", "Charlie", "David"]
    @State private var updates = [
        "Alice is hanging out at Central Park 🌳",
        "Bob just checked in at Starbucks ☕️",
        "Charlie is enjoying a movie at AMC 🎥",
        "David is traveling to the beach 🏖️"
    ]
    
    // For friend requests (set to true to show requests button)
    @State private var hasRequests = true
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background with gradient (reddish-orangish theme)
                LinearGradient(gradient: Gradient(colors: [Color(hex: "#ff6e40"), Color(hex: "#ff3d00")]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
                    // If there are friend requests, show a button
                    if hasRequests {
                        Button(action: {
                            // Handle requests action
                        }) {
                            HStack {
                                Image(systemName: "person.crop.circle.badge.plus")
                                    .foregroundColor(.white)
                                Text("Friend Requests")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(10)
                            .padding(.horizontal)
                        }
                        .padding(.top, 20)
                    }
                    
                    // Section title for chats
                    Text("Your Chats")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.leading, 20)
                        .padding(.top, 20)
                    
                    // Chats list
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(chats, id: \.self) { chat in
                                NavigationLink(destination: ChatView(friendName: chat)) {
                                    VStack {
                                        // Profile picture placeholder
                                        Image(systemName: "person.circle.fill")
                                            .resizable()
                                            .frame(width: 60, height: 60)
                                            .foregroundColor(.white)
                                            .background(Color.orange)
                                            .clipShape(Circle())
                                            .shadow(radius: 5)
                                        
                                        // Friend's name
                                        Text(chat)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }
                                    .padding(.top, 10)
                                    .frame(width: 100, height: 120)
                                    .background(Color.white.opacity(0.1))
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top, 10)
                    
                    // Section title for friend updates (stories)
                    Text("Updates")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.leading, 20)
                        .padding(.top, 30)
                    
                    // Updates list
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            ForEach(updates, id: \.self) { update in
                                VStack(alignment: .leading) {
                                    // Update text (friend's current location or activity)
                                    Text(update)
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.white.opacity(0.1))
                                        .cornerRadius(10)
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.top, 10)
                    
                    Spacer()
                }
            }
        }
    }
}

// Chat view for when a chat is clicked
struct ChatView: View {
    var friendName: String
    
    var body: some View {
        Text("Chatting with \(friendName)")
            .font(.largeTitle)
            .fontWeight(.bold)
            .navigationBarTitle(friendName, displayMode: .inline)
    }
}

// Add this extension to use a hex color in SwiftUI
/*extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 1  // Skip the '#' character
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}*/

struct HangoutView_Previews: PreviewProvider {
    static var previews: some View {
        HangoutView()
    }
}
