import SwiftUI
import URLImage

struct gesture2View: View {
    @State private var scale: CGFloat = 1
    @State private var previousScale: CGFloat = 1
        var magnificationGesture: some Gesture {
        MagnificationGesture()
            .onChanged { value in
                scale = previousScale * value.magnitude
            }
            .onEnded { value in
                previousScale = scale
            }
    }
    var body: some View {
        
            Image("ytges2")
                .resizable()
                .frame(width: 400, height: 240, alignment: .leading)
                .scaleEffect(scale)
                .gesture(magnificationGesture)
    }
}

