/*import SwiftUI

struct MovingBackground: View {
    @State private var startPoint = UnitPoint(x: 0, y: -0.5)
    @State private var endPoint = UnitPoint(x: 1.5, y: 1)

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Theme.primaryColor, Theme.secondaryColor]),
                       startPoint: startPoint,
                       endPoint: endPoint)
            .ignoresSafeArea()
            .onAppear {
                withAnimation(Animation.linear(duration: 10).repeatForever(autoreverses: true)) {
                    startPoint = UnitPoint(x: 1.5, y: 1)
                    endPoint = UnitPoint(x: 0, y: -0.5)
                }
            }
    }
}
*/
