import SwiftUI
import URLImage

struct gesture1View: View {
    @State private var opacity: Double = 0
    @State private var degrees: Double = 0
    @State private var previousDegrees: Double = 0
    var rotationGesture: some Gesture {
        RotationGesture()
            .onChanged { angle in
                degrees = previousDegrees + angle.degrees
            }
            .onEnded { angle in
                previousDegrees = degrees
            }
    }
    var body: some View {
        
            Image("ytges1")
                .resizable()
                .frame(width: 400, height: 240, alignment: .leading)
                .rotationEffect(.degrees(degrees))
                .gesture(rotationGesture)
                .opacity(opacity)
                .animation(.easeInOut(duration: 5), value: opacity)
                .onAppear {
                opacity = 1
                }
    }
}
