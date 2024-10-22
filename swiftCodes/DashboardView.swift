import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Background Image
                if let bgImage = UIImage(named: "home_page_bg.jpeg") {
                    Image(uiImage: bgImage)
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                } else {
                    Color.white.edgesIgnoringSafeArea(.all)
                }
                
                VStack {
                    // Profile and Notification section
                    HStack {
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.white)
                                .shadow(radius: 5)
                            
                            VStack(alignment: .leading) {
                                Text("Hi Srikar!")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text("Plan your hangout")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                        }

                        Spacer()

                        // Notification Icon
                        Button(action: {
                            // Notification action
                        }) {
                            Image(systemName: "bell.fill")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .shadow(radius: 5)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 50)

                    // Middle Section: Hangout History
                    VStack(alignment: .leading) {
                        Text("Your Hangouts")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(0..<5) { hangout in
                                    Button(action: {
                                        // Show detailed hangout info
                                    }) {
                                        Text("Hangout \(hangout)\n12 Oct 2024")
                                            .padding()
                                            .background(RoundedRectangle(cornerRadius: 25).fill(Color.orange))
                                            .foregroundColor(.white)
                                            .frame(width: 120, height: 80)
                                            .shadow(radius: 5)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    // Popular Hangout Spots
                    VStack(alignment: .leading) {
                        Text("Popular Hangout Spots")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                        
                        HStack(spacing: 15) {
                            ForEach(0..<3) { spot in
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.red)
                                    .frame(width: 120, height: 120)
                                    .shadow(radius: 5)
                                    .overlay(
                                        Text("Spot \(spot)")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                    )
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    Spacer()

                    // Plus Sign for New Hangout - Navigating to PreferencesView
                    NavigationLink(destination: PreferencesView()) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 70))
                            .foregroundColor(.orange)
                            .shadow(radius: 10)
                    }
                    .padding(.bottom, 30)
                }
            }
            .safeAreaInset(edge: .bottom) {
                // Navigation Bar with icons
                HStack(spacing: 40) {
                    NavigationLink(destination: DashboardView()) {
                        VStack {
                            Image(systemName: "house.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                            Text("Home")
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                    }
                    NavigationLink(destination: DiscoverView()) {
                        VStack {
                            Image(systemName: "magnifyingglass.circle.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                            Text("Discover")
                                .font(.caption)
                                .foregroundColor(.white)
                            }
                    }
                    VStack {
                        Image(systemName: "message.fill")
                            .font(.title2)
                            .foregroundColor(.white)
                        Text("Hangout")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    VStack {
                        Image(systemName: "person.fill")
                            .font(.title2)
                            .foregroundColor(.white)
                        Text("Me")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                }
                .padding(.bottom, 20)
                .background(Color.black.opacity(0.7)) // Ensure it's visible against light backgrounds
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

