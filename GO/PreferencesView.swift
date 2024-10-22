import SwiftUI

struct PreferencesView: View {
    @State private var selectedActivity = "Movie"
    @State private var selectedCuisine = "Italian"
    @State private var budgetRange = 50.0

    let activities = ["Movie", "Dinner", "Sports", "Coffee"]
    let cuisines = ["Italian", "Mexican", "Indian", "American"]

    var body: some View {
        ZStack {
           // MovingBackground()  // Assuming this is a custom view for a dynamic background

            VStack(alignment: .leading, spacing: 20) {
                Text("Preferences")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)  // Change title color to yellow
                    .shadow(radius: 5)

                Text("Type of Activity:")
                    .font(.headline)
                    .foregroundColor(.white)

                Picker("Select Activity", selection: $selectedActivity) {
                    ForEach(activities, id: \.self) {
                        Text($0)
                            .foregroundColor(.black)  // Change picker text color to black
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .background(Color.orange.opacity(0.6))  // Set background for the picker
                .cornerRadius(10)

                Text("Preferred Cuisine:")
                    .font(.headline)
                    .foregroundColor(.white)

                Picker("Select Cuisine", selection: $selectedCuisine) {
                    ForEach(cuisines, id: \.self) {
                        Text($0)
                            .foregroundColor(.black)  // Change picker text color to black
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .background(Color.orange.opacity(0.6))  // Set background for the picker
                .cornerRadius(10)

                Text("Budget Range:")
                    .font(.headline)
                    .foregroundColor(.white)

                Slider(value: $budgetRange, in: 0...100, step: 5)
                    .accentColor(.yellow)  // Change slider accent color to yellow

                HStack {
                    Text("Budget: \(Int(budgetRange))$")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Spacer()
                }

                Spacer()

                NavigationLink(destination: ResultsView()) {
                    Text("Submit Preferences")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.yellow)  // Yellow button
                        .foregroundColor(.black)   // Black text for contrast
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
            }
            .padding()
            .background(Color.red.ignoresSafeArea())  // Set background to red
        }
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}

