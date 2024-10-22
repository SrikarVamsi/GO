import SwiftUI

struct ResultsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Suggested Plans")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)  // Change text color to yellow
                    .padding(.bottom, 20)
                
                ForEach(0..<3) { plan in
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Plan \(plan + 1): Dinner & Movie Night")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)  // Change to orange color
                        
                        Text("Restaurant: Italian Bistro")
                            .foregroundColor(.white)  // Change to white for visibility
                        Text("Movie: Action Film at Cineplex")
                            .foregroundColor(.white)
                        Text("Cost: $50 per person")
                            .foregroundColor(.white)
                        Text("Distance: 2 miles away")
                            .foregroundColor(.white)
                        Text("Rating: 4.5⭐")
                            .foregroundColor(.yellow)
                        
                        NavigationLink(destination: ConfirmationView()) {
                            Text("Make Reservation")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.yellow)  // Yellow button
                                .foregroundColor(.black)   // Black text for contrast
                                .cornerRadius(10)
                                .transition(.opacity)
                                .animation(.easeInOut)
                        }
                    }
                    .padding()
                    .background(Color.red.opacity(0.6))  // Change background to red with opacity
                    .cornerRadius(10)
                }
            }
            .padding()
        }
        .background(Color.orange.ignoresSafeArea())  // Set background to orange
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}

