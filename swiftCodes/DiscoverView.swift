import SwiftUI

struct DiscoverView: View {
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                // Search Bar
                HStack {
                    TextField("Search for a new place or group", text: .constant(""))
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.horizontal)
                }
                .padding(.top, 20)
                
                // Fancy Heading
                Text("Wanna join a hangout?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                
                // Horizontal Scroll for Hangout Boxes
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        HangoutBoxView(groupCount: "3/10", price: "$25", time: "6 PM")
                        HangoutBoxView(groupCount: "5/8", price: "$40", time: "7 PM")
                        HangoutBoxView(groupCount: "2/6", price: "$20", time: "8 PM")
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 20)
                .background(Color.orange.opacity(0.2))
                
                // Fancy Line Below Scroll View
                Text("Don't have enough time to plan a hangout?")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                    .padding(.bottom, 10)
                
                Text("We'll do it for you!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                    .padding(.bottom, 20)
                
                // Suggested Plans Button
                Button(action: {
                    // Action for suggested plans
                }) {
                    Text("Suggested Plans")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
                
                Spacer()
                
                // Navigation Bar for Discover Page
                HStack(spacing: 40) {
                    NavigationLink(destination: DashboardView()) {
                        VStack {
                            Image(systemName: "house.fill")
                                .font(.title2)
                                .foregroundColor(.gray)
                            Text("Home")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    NavigationLink(destination: DiscoverView()) {
                        VStack {
                            Image(systemName: "magnifyingglass.circle.fill")
                                .font(.title2)
                                .foregroundColor(.orange)
                            Text("Discover")
                                .font(.caption)
                                .foregroundColor(.orange)
                        }
                    }
                    VStack {
                        Image(systemName: "message.fill")
                            .font(.title2)
                            .foregroundColor(.gray)
                        Text("Hangout")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    VStack {
                        Image(systemName: "person.fill")
                            .font(.title2)
                            .foregroundColor(.gray)
                        Text("Me")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.bottom, 20)
            }
        }
    }
}

struct HangoutBoxView: View {
    var groupCount: String
    var price: String
    var time: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(groupCount)
                    .font(.title3)
                    .foregroundColor(.black)
                Spacer()
                Text(price)
                    .font(.title3)
                    .foregroundColor(.black)
            }
            
            Text(time)
                .font(.headline)
                .foregroundColor(.gray)
            
            HStack(spacing: 8) {
                ForEach(0..<3) { _ in
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 30, height: 30)
                }
            }
            .padding(.top, 10)
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .frame(width: 200, height: 150)
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}

